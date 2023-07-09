import 'package:flutter/material.dart';
import 'package:presentation/page_view_model.dart';

class AddNewPageViewModel extends PageViewModel {
  late BuildContext _context;

  ready(BuildContext context) async {
    _context = context;

    notifyListeners();
  }
}
