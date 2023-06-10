import 'package:domain/models/sprint.dart';

import 'package:flutter/material.dart';
import 'package:presentation/page_view_model.dart';

class SprintPlannerViewModel extends PageViewModel {
  List<Sprint> _sprints = [];
  List<Sprint> get sprints => _sprints;

  ready(BuildContext context) async {
    _sprints = await sprintManager.getAllSprints(1);
    observer.subscribe("sprint_planner_item_removed", onItemRemoved);
    notifyListeners();
  }

  sprintBoardStoryAdded(int id, int sprintId) async {
    var workItem = await workItemManager.getWorkItem(id);
    if (workItem == null) return;

    await observer
        .getObserver("sprint_board_card_added_$sprintId")
        .call(workItem);

    await observer.getObserver("on_sprint_item_accepted").call(id);
  }

  onAddNewSprint() {}

  onSearchSprint() {}

  onItemRemoved(int data) {
    var sprint = _sprints.firstWhere(
      (element) => element.stories?.any((story) => story.id == data) ?? false,
    );

    _sprints
        .firstWhere((element) => element.id == sprint.id)
        .stories
        ?.removeWhere((element) => element.id == data);

    notifyListeners();
  }
}
