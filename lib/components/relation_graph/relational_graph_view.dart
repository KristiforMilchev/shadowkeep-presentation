import 'package:domain/styles.dart';
import 'package:flow_graph/flow_graph.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/relation_graph/relational_graph_viewmoidel.dart';
import 'package:stacked/stacked.dart';

class RelationalGraphView extends StatelessWidget {
  final String observable;
  final Axis orintation;
  const RelationalGraphView({
    super.key,
    required this.observable,
    required this.orintation,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RelationalGraphViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(context, observable),
      builder: (context, viewModel, child) => Container(
        color: ThemeStyles.secondaryColor,
        child: FlowGraphView(
          enabled: false,
          root: viewModel.root,
          direction: orintation,
          centerLayout: true,
          builder: (context, node) {
            return node.data;
          },
        ),
      ),
    );
  }
}
