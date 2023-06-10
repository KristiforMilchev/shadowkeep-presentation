import 'package:domain/models/work_item.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:presentation/components/work_item_card/work_item_card_viewmodel.dart';
import 'package:stacked/stacked.dart';

class WorkItemCard extends StatelessWidget {
  final WorkItem? workItem;
  final int childrenCount;
  final Function onAddNewEvent;
  final Function onEditEvent;
  final Function onDeleteEvent;
  final bool isDeleteDisabled;
  final String icon;
  final String childIcon;
  final bool constrictSize;
  final bool hideActions;
  const WorkItemCard({
    super.key,
    required this.workItem,
    required this.onAddNewEvent,
    required this.onEditEvent,
    required this.onDeleteEvent,
    this.isDeleteDisabled = false,
    this.childrenCount = 0,
    this.icon = "missing.svg",
    this.childIcon = "missing.svg",
    this.constrictSize = false,
    this.hideActions = false,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => WorkItemCardViewModel(),
      builder: (context, viewModel, child) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: ThemeStyles.mainColor,
          border:
              workItem != null ? viewModel.getWorkItemBorder(workItem!) : null,
        ),
        child: Column(
          children: [
            Visibility(
              visible: !hideActions,
              child: SizedBox(
                width: constrictSize ? 300 : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 82,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: ThemeStyles.secondaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/$icon",
                            package: "domain",
                            fit: BoxFit.contain,
                            width: 25,
                            height: 25,
                            color: ThemeStyles.fontPrimary,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            workItem?.internalId.toString() ?? "",
                            style: ThemeStyles.innerHeading,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text(""),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: ThemeStyles.secondaryColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => onAddNewEvent.call(),
                            child: Icon(
                              Icons.add,
                              color: ThemeStyles.actionColor,
                            ),
                          ),
                          InkWell(
                            onTap: () => onEditEvent.call(),
                            child: Icon(
                              Icons.edit,
                              color: ThemeStyles.actionColor,
                            ),
                          ),
                          InkWell(
                            onTap: () => onDeleteEvent.call(),
                            child: Icon(
                              Icons.delete,
                              color: isDeleteDisabled
                                  ? ThemeStyles.fontSecondary
                                  : ThemeStyles.actionColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: Column(
                children: [
                  Text(
                    workItem?.name ?? "",
                    style: ThemeStyles.regularParagraph,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: constrictSize ? 300 : null,
                    child: Text(
                      workItem?.description ?? "",
                      style: ThemeStyles.regularParagraph,
                      textAlign: TextAlign.start,
                      maxLines: 8,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: constrictSize ? 300 : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 82,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: ThemeStyles.secondaryColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          workItem?.assignedTo ?? "",
                          style: ThemeStyles.innerHeading,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: childrenCount > 0,
                          child: Text(
                            childrenCount.toString(),
                            style: ThemeStyles.innerHeading,
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/images/$childIcon",
                          package: "domain",
                          fit: BoxFit.contain,
                          width: 25,
                          height: 25,
                          color: ThemeStyles.fontPrimary,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 82,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: ThemeStyles.secondaryColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          workItem?.remaining.toString() ?? "",
                          style: ThemeStyles.innerHeading,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
