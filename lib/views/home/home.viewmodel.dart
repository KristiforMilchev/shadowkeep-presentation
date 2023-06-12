import 'package:domain/models/book.dart';
import 'package:domain/models/enums.dart';
import 'package:domain/models/transition_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/interfaces/ibook_service.dart';
import 'package:presentation/page_view_model.dart';

class HomeViewModel extends PageViewModel {
  late BuildContext _context;
  List<Book> _books = [];
  List<Book> get books => _books;
  ready(BuildContext context) async {
    _context = context;

    compute((IBookService message) async {
      var getData = message.getBooks();
      return getData;
    }, bookService)
        .then((value) {
      _books = value;
      notifyListeners();
    });
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

  removeBook(Book book) {}

  onBookSelected(Book book) {
    router.changePage(
      "/open-book-view",
      _context,
      TransitionData(
        next: PageTransition.slideForward,
      ),
    );
  }
}
