import 'package:domain/models/enums.dart';
import 'package:domain/models/transition_data.dart';
import 'package:flutter/material.dart';

import 'package:presentation/page_view_model.dart';

class PlanningMenuBarViewModel extends PageViewModel {
  late BuildContext _context;

  ready(BuildContext context) {
    _context = context;
  }

  void openBoardPressed() {
    router.changePage(
      "/kanban-view",
      _context,
      TransitionData(next: PageTransition.slideForward),
    );
  }

  void openFinancePressed() {}

  void onSprintPlanningPressed() {
    router.changePage(
      "/planning-view",
      _context,
      TransitionData(next: PageTransition.slideForward),
    );
  }

  void openSprintPlanner() {
    router.changePage(
      "/sprint-planner-view",
      _context,
      TransitionData(next: PageTransition.slideForward),
    );
  }
}
