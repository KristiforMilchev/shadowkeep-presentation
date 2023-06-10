import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_icon_button/custom_icon_button.dart';
import 'package:presentation/components/custom_text_field/custom_text_field.dart';
import 'package:presentation/components/planner_frame/planner_frame.dart';
import 'package:presentation/components/sprint_board/sprint_board_view.dart';
import 'package:presentation/components/story_backlog/story_backlog_view.dart';
import 'package:presentation/views/planning/sprint_planner/sprint_planner_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../components/planning_menu_bar/planning_menu_bar_view.dart';

class SprintPlannerView extends StatelessWidget {
  const SprintPlannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SprintPlannerViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(context),
      builder: (context, viewModel, child) => PlannerFrame(
        child: Expanded(
          child: Row(
            children: [
              const PlanningMenuBar(),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 300,
                          child: CustomTextField(
                            radialRadius: 0,
                            borderRadius: 0,
                            // icon: SizedBox(
                            //   width: 60,
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.search,
                            //         color: ThemeStyles.actionColor,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            floatingLabel: "",
                            onChange: viewModel.onSearchSprint,
                          ),
                        ),
                        Row(
                          children: [
                            CustomIconButton(
                              icon: const Icon(
                                Icons.table_chart,
                                color: ThemeStyles.fontPrimary,
                              ),
                              label: "",
                              callback: viewModel.onAddNewSprint,
                            ),
                            CustomIconButton(
                              icon: const Icon(
                                Icons.table_rows_sharp,
                                color: ThemeStyles.fontPrimary,
                              ),
                              label: "",
                              callback: viewModel.onAddNewSprint,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const StoryBacklog(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          label: "Add",
                          callback: viewModel.onAddNewSprint,
                        ),
                        Text(
                          "Sprints",
                          style: ThemeStyles.regularHeading,
                        ),
                        SizedBox(
                          width: 300,
                          child: CustomTextField(
                            radialRadius: 0,
                            borderRadius: 0,
                            // icon: SizedBox(
                            //   width: 60,
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.search,
                            //         color: ThemeStyles.actionColor,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            floatingLabel: "",
                            onChange: viewModel.onSearchSprint,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...viewModel.sprints
                                .map(
                                  (e) => SprintBoard(
                                    id: e.id,
                                    onAddedCallback: (data) =>
                                        viewModel.sprintBoardStoryAdded(
                                      data,
                                      e.id,
                                    ),
                                  ),
                                )
                                .toList()
                          ],
                        ),
                      ),
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
