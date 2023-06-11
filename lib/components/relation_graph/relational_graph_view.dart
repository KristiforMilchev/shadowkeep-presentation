import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:presentation/components/relation_graph/relational_graph_viewmoidel.dart';
import 'package:stacked/stacked.dart';

class RelationalGraphView extends StatelessWidget {
  final String observable;
  const RelationalGraphView({super.key, required this.observable});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RelationalGraphViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(context, observable),
      builder: (context, viewModel, child) => Expanded(
        child: Stack(
          children: [
            Container(
              color: ThemeStyles.secondaryColor,
              child: InteractiveViewer(
                constrained: false,
                boundaryMargin: const EdgeInsets.all(100),
                minScale: 0.01,
                maxScale: 10.6,
                child: GraphView(
                  graph: viewModel.graph,
                  algorithm: viewModel.getNodeBuilder(),
                  paint: Paint()
                    ..color = Colors.green
                    ..strokeWidth = 1
                    ..style = PaintingStyle.stroke,
                  builder: (Node node) {
                    // I can decide what widget should be shown here based on the id
                    var a = node.key?.value as int;
                    return viewModel.rectangleWidget(a);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
