import 'package:flutter/material.dart';
import 'package:presentation/page_view_model.dart';

class AddNewPageViewModel extends PageViewModel {
  late BuildContext _context;

  ready(BuildContext context) async {
    _context = context;

    notifyListeners();
  }

  applyMargin() {
    double width = MediaQuery.of(_context).size.width;

    if (width < 1920) {
      return const EdgeInsets.fromLTRB(0, 0, 0, 0);
    }

    return width > 1930
        ? const EdgeInsets.fromLTRB(100, 0, 100, 0)
        : const EdgeInsets.fromLTRB(50, 0, 50, 0);
  }
}
