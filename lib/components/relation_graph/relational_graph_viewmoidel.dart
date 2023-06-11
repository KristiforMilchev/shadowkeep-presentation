import 'package:domain/models/relational_binding.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:presentation/page_view_model.dart';

class RelationalGraphViewModel extends PageViewModel {
  late BuildContext _context;
  List<RelationalBinding> _data = [];

  List<Widget> typesData = [];
  Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  ready(BuildContext context, String key) async {
    _context = context;
    observer.subscribe(key, onLoadData);
  }

  getNodeBuilder() {
    return BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder));
  }

  Widget rectangleWidget(int a) {
    try {
      var item = _data.firstWhere((element) => element.id == a);

      return item.content;
    } catch (exception) {
      print(exception);
      return Placeholder();
    }
  }

  drawGraph() {
    try {
      for (var element in _data) {
        var related = _data
            .where((workItem) => workItem.relatedTo == element.id)
            .toList();

        if (related.isEmpty && _data.length == 1 || _data.length == 1) {
          graph.addNode(Node.Id(_data.first.id));
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

  onLoadData(List<RelationalBinding> data) {
    _data = data;
    drawGraph();
  }
}
