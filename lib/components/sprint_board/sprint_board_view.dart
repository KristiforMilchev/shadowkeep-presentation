import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/sprint_board/sprint_board_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../work_item_card/work_item_card_view.dart';

class SprintBoard extends StatelessWidget {
  final int id;
  final EdgeInsets? margin;
  final Function onAddedCallback;

  const SprintBoard({
    super.key,
    required this.id,
    required this.onAddedCallback,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SprintBoardViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(id),
      builder: (context, viewModel, child) => DragTarget<int>(
        builder: (context, candidateData, rejectedData) => Container(
          color: ThemeStyles.secondaryColor,
          margin: margin,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ThemeStyles.mainColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: const Icon(
                      Icons.menu_book_sharp,
                      color: ThemeStyles.fontPrimary,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ThemeStyles.mainColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      viewModel.name,
                      style: ThemeStyles.regularHeading,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 120,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ThemeStyles.mainColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      viewModel.workItems.length.toString(),
                      style: ThemeStyles.regularHeading,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              if (viewModel.workItems.isNotEmpty)
                ...viewModel.workItems
                    .map(
                      (e) => Draggable(
                        feedback: Material(
                          color: Colors.transparent,
                          child: WorkItemCard(
                            constrictSize: true,
                            workItem: e,
                            onAddNewEvent: () => {},
                            onEditEvent: () => {},
                            onDeleteEvent: () => {},
                          ),
                        ),
                        data: e.id,
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          child: WorkItemCard(
                            constrictSize: false,
                            workItem: e,
                            onAddNewEvent: () => {},
                            onEditEvent: () => {},
                            onDeleteEvent: () => {},
                          ),
                        ),
                      ),
                    )
                    .toList(),
              if (viewModel.workItems.isEmpty)
                SizedBox(
                  height: 150,
                  child: Center(
                    child: Text(
                      "Empty Sprint",
                      style: ThemeStyles.innerHeading,
                    ),
                  ),
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ThemeStyles.mainColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      viewModel.estimatedCost,
                      style: ThemeStyles.regularHeading,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  if (viewModel.topic != null)
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ThemeStyles.mainColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        viewModel.topic!,
                        style: ThemeStyles.regularHeading,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Container(
                    width: 120,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ThemeStyles.mainColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      viewModel.name,
                      style: ThemeStyles.regularHeading,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        onAccept: (data) => onAddedCallback.call(data),
      ),
    );
  }
}
