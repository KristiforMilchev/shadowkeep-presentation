import 'package:flutter/material.dart';
import 'package:presentation/page_view_model.dart';

class PageEditorViewModel extends PageViewModel {
  late BuildContext _context;
  final double _minPageWidth = 600;
  final double _maxPageWidth = 1500;
  double _pageWidth = 1500;
  double get pageWidth => _pageWidth;

  double _popupX = 0;
  double _popupY = 0;

  double get popupX => _popupX;
  double get poupY => _popupY;

  bool _isSuggestionOpen = false;
  get isSuggestionOpen => _isSuggestionOpen;

  ready(BuildContext context) {
    _context = context;
    observer.subscribe('open_reference_box', onRefBoxRequest);
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

  void onPageWidthChanged(double value) {
    _pageWidth = value;
    notifyListeners();
  }

  dragUpdated(DragUpdateDetails details) {
    if (details.delta.dx < 0) {
      _pageWidth =
          _pageWidth <= _minPageWidth ? _minPageWidth : _pageWidth - 10;
      notifyListeners();
    } else {
      if (_pageWidth >= _maxPageWidth) {
        _pageWidth = _maxPageWidth;
        return;
      }
      _pageWidth =
          _pageWidth >= _maxPageWidth ? _maxPageWidth : _pageWidth + 10;
      notifyListeners();
    }
    print("${_pageWidth} Page Width");
    print("${_minPageWidth} MIN Width");
  }

  onRefBoxRequest(GlobalKey key) {
    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);

    _popupX = (_pageWidth / 2) - 300;
    _popupY = 180;
    _isSuggestionOpen = true;

    notifyListeners();
  }

  onIntlMenuClosed() {
    _isSuggestionOpen = false;
    notifyListeners();
  }
}
