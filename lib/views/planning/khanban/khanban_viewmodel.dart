import 'package:domain/models/board.dart';
import 'package:domain/models/work_item.dart';
import 'package:domain/models/work_item_group.dart';
import 'package:flutter/material.dart';

import 'package:presentation/page_view_model.dart';

class KhanbanViewModel extends PageViewModel {
  late BuildContext _context;

  List<WorkItemGroup> _sprintWorkItems = [];
  List<WorkItemGroup> get sprintWorkItems => _sprintWorkItems;

  List<Board> _boards = [];
  List<Board> get boards => _boards;

  ready(BuildContext context) async {
    _context = context;

    _sprintWorkItems = await workItemManager.getSprintWorkItems(1, 1);
    _boards = await workItemManager.getProjectBoards(1);
    notifyListeners();
  }

  onAddNew(WorkItem workItem) {}

  onEditNew(WorkItem workItem) {}

  onDelete(WorkItem workItem) {}

  onEdit(WorkItem workItem) {}

  boardItemAdded(int workItemId, int board) {
    var workItem = getBoardWorkItem(workItemId);
    if (workItem == null) {
      return;
    }

    _boards
        .firstWhere((currentBoard) => currentBoard.id == workItem.boardId)
        .workItems
        .remove(workItem);
    workItem.boardId = board;
    _boards
        .firstWhere((currentBoard) => currentBoard.id == workItem.boardId)
        .workItems
        .add(workItem);
    notifyListeners();
  }

  WorkItem? getBoardWorkItem(int workItemId) {
    for (var board in _boards) {
      var exists = board.workItems.any((element) => element.id == workItemId);
      if (exists) {
        return board.workItems
            .firstWhere((element) => element.id == workItemId);
      }
    }
    return null;
  }

  String sumRemaining(int id) {
    double result = 0;
    _boards
        .firstWhere((board) => board.id == id)
        .workItems
        .map((e) => e.remaining)
        .toList()
        .forEach((element) {
      result += element;
    });
    return result.toString();
  }

  onStoryAddItem(WorkItemGroup userStory) {}

  onNewPressed() {}
}
