import 'package:flutter/material.dart';
import 'package:presentation/components/planner_frame/planner_frame.dart';
import 'package:presentation/components/work_item_board/work_item_board.dart';
import 'package:presentation/views/planning/khanban/khanban_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../components/planning_menu_bar/planning_menu_bar_view.dart';
import '../../../components/sprint_board_header/sprint_board_header_view.dart';
import '../../../components/story_header/story_header.dart';

class KhanbanView extends StatelessWidget {
  const KhanbanView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => KhanbanViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(context),
      builder: (context, viewModel, child) => PlannerFrame(
        child: Expanded(
          child: Row(
            children: [
              const PlanningMenuBar(),
              Expanded(
                child: Column(
                  children: [
                    const SprintBoardHeader(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: viewModel.sprintWorkItems.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            const SizedBox(
                              width: 16,
                            ),
                            StoryHeader(
                              story: viewModel.sprintWorkItems.elementAt(index),
                              callback: (_) => viewModel.onStoryAddItem(
                                viewModel.sprintWorkItems.elementAt(index),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...viewModel.boards
                                      .map(
                                        (e) => WorkItemBoard(
                                          margin: const EdgeInsets.all(10),
                                          id: e.id,
                                          workItems: viewModel.sprintWorkItems
                                              .elementAt(index)
                                              .workItems
                                              .where(
                                                (element) =>
                                                    element.boardId == e.id,
                                              )
                                              .toList(),
                                          remaining: "0",
                                          onAddNewEvent: viewModel.onAddNew,
                                          onEditEvent: viewModel.onEdit,
                                          onDeleteEvent: viewModel.onDelete,
                                          onAddedCallback:
                                              viewModel.boardItemAdded,
                                        ),
                                      )
                                      .toList()
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
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
