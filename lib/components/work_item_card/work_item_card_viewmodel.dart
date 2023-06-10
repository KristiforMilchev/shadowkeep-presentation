import 'package:domain/models/work_item.dart';
import 'package:flutter/material.dart';
import 'package:presentation/page_view_model.dart';

class WorkItemCardViewModel extends PageViewModel {
  getWorkItemBorder(WorkItem workItem) {
    var border =
        Border.all(color: const Color.fromRGBO(113, 0, 255, 1), width: 1);
    switch (workItem.workItemType) {
      case 1:
        border =
            Border.all(color: const Color.fromRGBO(255, 132, 53, 1), width: 1);

        break;
      case 2:
        border =
            Border.all(color: const Color.fromRGBO(113, 0, 255, 1), width: 1);
        break;
      case 3:
        border =
            Border.all(color: const Color.fromRGBO(53, 154, 255, 1), width: 1);
        break;
      case 4:
        border =
            Border.all(color: const Color.fromRGBO(255, 217, 53, 1), width: 1);

        break;
      case 5:
        border =
            Border.all(color: const Color.fromRGBO(255, 53, 181, 1), width: 1);

        break;
      case 6:
        border =
            Border.all(color: const Color.fromRGBO(216, 5, 0, 1), width: 1);

        break;
    }
    return border;
  }
}
