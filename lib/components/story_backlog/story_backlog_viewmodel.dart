import 'package:collection/collection.dart';
import 'package:domain/models/work_item_group.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/interfaces/iworkitem_manager.dart';
import 'package:presentation/page_view_model.dart';

class StoryBacklogViewModel extends PageViewModel {
  late IWorkItemManager _workItemManager;
  List<List<WorkItemGroup>> _stories = [];
  List<List<WorkItemGroup>> get stories => _stories;

  ready(BuildContext context) async {
    observer.subscribe("on_sprint_item_accepted", onSprintItemAccepted);
    _workItemManager = getIt.get<IWorkItemManager>();
    var workItemStories = await workItemManager.getProjectBacklogStories(1);
    var i = 1;
    List<WorkItemGroup> storieRow = [];
    for (var element in workItemStories) {
      if (i > 4) {
        var currentRow = storieRow;
        _stories.add(currentRow);
        storieRow = [];
        i = 1;
      }
      storieRow.add(element);
      i++;
    }

    if (storieRow.isNotEmpty) {
      _stories.add(storieRow);
    }

    notifyListeners();
  }

  onStoryAdded(int data) async {
    var workItem = await _workItemManager.getWorkItem(data);

    if (workItem != null) {
      var story = WorkItemGroup(
        id: workItem.id,
        groupName: workItem.name,
        workItems: [],
        current: workItem,
      );
      var board = getEmptyRow();
      board.add(story);
      observer.getObserver("sprint_planner_item_removed").call(data);
      notifyListeners();
    }
  }

  onSprintItemAccepted(int id) {
    var getRow = _stories
        .firstWhere((element) => element.any((stories) => stories.id == id));
    var item = getRow.firstWhere((element) => element.id == id);
    getRow.remove(item);
    notifyListeners();
  }

  @override
  void dispose() {
    observer.dispose("on_sprint_item_accepted");
    super.dispose();
  }

  List<WorkItemGroup> getEmptyRow() {
    var board = _stories.firstWhereOrNull((element) => element.length < 4);

    if (board == null) return [];

    return board;
  }
}
