import 'package:domain/models/work_item.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';

import '../work_item_card/work_item_card_view.dart';

class WorkItemBoard extends StatelessWidget {
  final int id;
  final List<WorkItem> workItems;
  final EdgeInsets? margin;
  final Function onAddNewEvent;
  final Function onEditEvent;
  final Function onDeleteEvent;
  final String remaining;
  final Function onAddedCallback;

  const WorkItemBoard({
    super.key,
    required this.id,
    required this.workItems,
    required this.remaining,
    required this.onAddNewEvent,
    required this.onEditEvent,
    required this.onDeleteEvent,
    required this.onAddedCallback,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: DragTarget<int>(
        builder: (context, candidateData, rejectedData) => Container(
          color: ThemeStyles.secondaryColor,
          margin: margin,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (workItems.isNotEmpty)
                ...workItems.map(
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
                        onAddNewEvent: () => onAddNewEvent.call(e),
                        onEditEvent: () => onEditEvent.call(e),
                        onDeleteEvent: () => onDeleteEvent.call(e),
                      ),
                    ),
                  ),
                ),
              if (workItems.isEmpty)
                Expanded(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(80),
                      child: Text(
                        "Empty board",
                        style: ThemeStyles.whiteParagraph,
                      ),
                    ),
                  ),
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 81,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ThemeStyles.mainColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      workItems.length.toString(),
                      style: ThemeStyles.regularHeading,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 81,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ThemeStyles.mainColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      remaining,
                      style: ThemeStyles.regularHeading,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        onAccept: (data) => onAddedCallback.call(data, id),
      ),
    );
  }
}
