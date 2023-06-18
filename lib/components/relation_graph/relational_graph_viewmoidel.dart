import 'package:domain/models/relational_binding.dart';
import 'package:flow_graph/flow_graph.dart';
import 'package:flutter/material.dart';
import 'package:presentation/page_view_model.dart';

class RelationalGraphViewModel extends PageViewModel {
  List<RelationalBinding> _data = [];
  bool get hasData => _data.isNotEmpty;
  List<Widget> typesData = [];
  GraphNode root = GraphNode(data: 'Root', isRoot: true);
  late String _key;
  ready(BuildContext context, String key) async {
    _key = key;
    observer.subscribe(key, onLoadData);
  }

  drawGraph() {
    var main = _data.first;
    root = GraphNode(data: main.content, isRoot: true);

    main.related.forEach((element) {
      root.addNext(GraphNode(data: element.content));
    });

    var isFirst = true;
    var prevNode = root;

    for (var chapter in _data.skip(1)) {
      var buildNode = GraphNode();

      buildNode.data = chapter.content;
      for (var element in chapter.related) {
        buildNode.addNext(GraphNode(data: element.content));
      }

      prevNode.addNext(buildNode);
      prevNode = buildNode;
      isFirst = false;
    }

    notifyListeners();
  }

  onLoadData(List<RelationalBinding> data) {
    _data = data;
    drawGraph();
  }

  @override
  void dispose() {
    observer.dispose(_key);
    super.dispose();
  }
}
