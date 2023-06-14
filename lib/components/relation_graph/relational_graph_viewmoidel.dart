import 'package:domain/models/relational_binding.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:presentation/page_view_model.dart';

class RelationalGraphViewModel extends PageViewModel {
  List<RelationalBinding> _data = [];

  List<Widget> typesData = [];
  Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  ready(BuildContext context, String key) async {
    observer.subscribe(key, onLoadData);
  }

  getNodeBuilder() {
    return BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder));
  }

  Widget rectangleWidget(int a) {
    try {
      var item = _data.firstWhere((element) => element.id == a);

      return Placeholder(
        child: Text(item.id.toString()),
      );
    } catch (exception) {
      return const Placeholder();
    }
  }

  drawGraph() {
    try {
      for (var element in _data) {
        if (element.related.isNotEmpty) {
          graph.addNode(Node.Id(element.id));

          for (var relatedNode in element.related) {
            graph.addNode(Node.Id(relatedNode.id));
            graph.addEdge(
              Node.Id(element.id),
              Node.Id(relatedNode.id),
              paint: Paint()..color = ThemeStyles.actionColor,
            );
          }
        }
      }

      builder
        ..siblingSeparation = (100)
        ..levelSeparation = (150)
        ..subtreeSeparation = (150)
        ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
      // ignore: empty_catches
    } catch (exception) {}
    notifyListeners();
  }

  onLoadData(List<RelationalBinding> data) {
    _data = data;
    drawGraph();
  }
}
