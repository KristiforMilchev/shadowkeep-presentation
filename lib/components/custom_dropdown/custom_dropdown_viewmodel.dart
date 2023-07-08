import 'package:flutter/material.dart';
import 'package:presentation/page_view_model.dart';

class CustomDropdownViewModel extends PageViewModel {
  late BuildContext _context;
  String _selectedValue = "";
  String get selectedValue => _selectedValue;

  List<({int id, String fontName, TextStyle font})> _data = [];
  List<({int id, String fontName, TextStyle font})> get data => _data;
  ready(BuildContext context,
      List<({int id, String fontName, TextStyle font})> content) {
    _data = content;
    _selectedValue = _data.first.fontName;
    notifyListeners();
  }

  void onChanged(String? value) {
    _selectedValue = value!;
    notifyListeners();
  }
}
