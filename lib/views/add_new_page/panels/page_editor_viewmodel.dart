import 'package:flutter/material.dart';
import 'package:presentation/page_view_model.dart';

class PageEditorViewModel extends PageViewModel {
  late BuildContext _context;

  ready(BuildContext context) {
    _context = context;
  }

  onPreviousPagePressed() {}

  double? calculateWidth() {
    var displaySize = MediaQuery.of(_context).size;
    double width = displaySize.width;

    if (width > 1920) {
      return 500;
    }

    if (width < 1920) {
      return 200;
    }

    return 400;
  }
}
