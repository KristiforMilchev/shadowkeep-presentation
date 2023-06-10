import 'package:domain/models/enums.dart';
import 'package:domain/models/transition_data.dart';
import 'package:domain/models/work_item.dart';
import 'package:domain/models/work_item_type.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:presentation/components/work_item_card/work_item_card_view.dart';

import '../../../page_view_model.dart';

class PlanningViewModel extends PageViewModel {
  late BuildContext _context;
  List<WorkItem> _workItems = [];

  List<WorkItemType> typesData = [];
  late List<WorkItemType> _enabledTypes = [];
  Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  ready(BuildContext context) async {
    _context = context;
    await loadData();
  }

  loadData() async {
    _workItems = await workItemManager.getProjectWorkItems(1);
    typesData = await workItemManager.getWorkItemTypes();
    _enabledTypes.addAll(typesData);

    drawGraph();
  }

  getNodeBuilder() {
    return BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder));
  }

  Widget rectangleWidget(int a) {
    try {
      var item = _workItems.firstWhere((element) => element.id == a);
      var type = getWorkItemIcon(item.workItemType);
      var childIcon = "";

      if (_enabledTypes.any((element) => element.id == type.id + 1)) {
        childIcon = _enabledTypes
            .firstWhere((element) => element.id == type.id + 1)
            .getIcon();
      }

      return WorkItemCard(
        workItem: item,
        constrictSize: true,
        icon: type.getIcon(),
        childIcon: childIcon,
        onAddNewEvent: () => addNewWorkItem(item.id),
        onEditEvent: () => editWorkItem(item),
        onDeleteEvent: () => deleteWorkItem(item.id, item.relatedTo),
        isDeleteDisabled:
            _workItems.any((element) => element.relatedTo == item.id),
        childrenCount:
            _workItems.where((element) => element.relatedTo == item.id).length,
      );
    } catch (exception) {
      print(exception);
      return Placeholder();
    }
  }

  drawGraph() {
    try {
      for (var element in _workItems.where(
        (element) =>
            _enabledTypes.any((type) => type.id == element.workItemType),
      )) {
        var related = _workItems
            .where((workItem) =>
                workItem.relatedTo == element.id &&
                _enabledTypes
                    .any((element) => element.id == workItem.workItemType))
            .toList();

        if (related.isEmpty && _workItems.length == 1 ||
            _enabledTypes.length == 1) {
          graph.addNode(Node.Id(_workItems.first.id));
        }

        for (var relatedNode in related) {
          graph.addEdge(
            Node.Id(element.id),
            Node.Id(relatedNode.id),
            paint: Paint()..color = ThemeStyles.actionColor,
          );
        }
      }

      builder
        ..siblingSeparation = (100)
        ..levelSeparation = (150)
        ..subtreeSeparation = (150)
        ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
    } catch (exception) {
      print(exception);
    }
    notifyListeners();
  }

  onNewPressed() {
    router.changePage(
      "/home-view",
      _context,
      TransitionData(next: PageTransition.slideForward),
    );
  }

  addNewWorkItem(int id) async {
    var parent = _workItems.firstWhere((element) => element.id == id);
    var newType = 1;
    switch (parent.workItemType) {
      case 1:
        newType = 2;
        break;
      case 2:
        newType = 3;
        break;
      case 3:
        newType = 4;
        break;
      case 4:
        newType = 4;
        break;
    }
    var workItem = WorkItem(
      id: _workItems.length + 1,
      internalId: _workItems.last.internalId + 1,
      name: "test",
      assignedTo: "KM",
      remaining: 5,
      workItemType: newType,
      projectId: 1,
      relatedTo: id,
    );
    _workItems.add(workItem);
    await workItemManager.addWorkItem(workItem, 1);
    graph = Graph()..isTree = true;
    drawGraph();
  }

  editWorkItem(WorkItem item) {}

  deleteWorkItem(int id, int? relatedTo) async {
    var isDeleted = await workItemManager.deleteWorkItem(id);
    if (isDeleted) {
      _workItems.removeWhere((element) => element.id == id);
      graph = Graph()..isTree = true;
      drawGraph();
    }
  }

  onFilterChanged(int id, bool state) {
    if (!state) {
      var recursiveDown =
          _enabledTypes.where((element) => element.id > id).toList();
      for (var lowerInherited in recursiveDown) {
        _enabledTypes.remove(lowerInherited);
      }
      var getCrrent = _enabledTypes.firstWhere((element) => element.id == id);
      _enabledTypes.remove(getCrrent);
    } else if (!_enabledTypes.any((element) => element.id == id) && state) {
      typesData.where((element) => element.id >= id).forEach((e) {
        _enabledTypes.add(e);
      });
    }

    graph = Graph()..isTree = true;
    drawGraph();
  }

  WorkItemType getWorkItemIcon(int id) {
    return _enabledTypes.firstWhere((element) => element.id == id);
  }
}
