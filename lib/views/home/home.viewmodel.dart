import 'package:domain/models/enums.dart';
import 'package:domain/models/transition_data.dart';
import 'package:flutter/material.dart';
import 'package:presentation/page_view_model.dart';

class HomeViewModel extends PageViewModel {
  late BuildContext _context;
  List<bool> _books = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> get books => _books;
  ready(BuildContext context) {
    _context = context;
  }

  onPlanningPressed() {
    router.changePage(
      "/planning-view",
      _context,
      TransitionData(next: PageTransition.slideForward),
    );
  }

  onSearchChanged() {}

  onAddNewBook() {}

  removeBook(bool elementAt) {}

  onBookSelected(bool elementAt) {
    router.changePage(
      "/open-book-view",
      _context,
      TransitionData(
        next: PageTransition.slideForward,
      ),
    );
  }
}
