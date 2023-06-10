import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:presentation/components/custom_icon_button/custom_icon_button.dart';
import 'package:presentation/components/planner_frame/planner_frame.dart';
import 'package:presentation/components/planning_menu_bar/planning_menu_bar_view.dart';
import 'package:presentation/components/work_item_filter_nav/work_item_filter_nav_view.dart';
import 'package:presentation/views/planning/planning/planning_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../components/bottom_nav_bar/bottom_nav_bar_view.dart';

class PlanningView extends StatelessWidget {
  const PlanningView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PlanningViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(context),
      builder: (context, viewModel, child) => PlannerFrame(
        child: Expanded(
          child: Row(
            children: [
              const PlanningMenuBar(),
              Expanded(
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
                    WorkItemFilterNav(
                      onTapEvent: viewModel.onFilterChanged,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
