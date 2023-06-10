import 'package:flutter/material.dart';
import 'package:presentation/components/story_backlog/story_backlog_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../work_item_card/work_item_card_view.dart';

class StoryBacklog extends StatelessWidget {
  const StoryBacklog({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => StoryBacklogViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(context),
      builder: (context, viewModel, child) => DragTarget<int>(
        onAccept: (data) => viewModel.onStoryAdded(data),
        builder: (context, candidateData, rejectedData) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...viewModel.stories
                .map(
                  (e) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...e
                          .map(
                            (e) => Draggable(
                              feedback: Material(
                                color: Colors.transparent,
                                child: WorkItemCard(
                                  constrictSize: true,
                                  workItem: e.current,
                                  onAddNewEvent: () => {},
                                  onEditEvent: () => {},
                                  onDeleteEvent: () => {},
                                ),
                              ),
                              data: e.id,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: WorkItemCard(
                                  hideActions: true,
                                  constrictSize: true,
                                  workItem: e.current,
                                  onAddNewEvent: () {},
                                  onEditEvent: () {},
                                  onDeleteEvent: () {},
                                ),
                              ),
                            ),
                          )
                          .toList()
                    ],
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
