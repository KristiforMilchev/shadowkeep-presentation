import 'package:domain/models/intellisense_data.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/interfaces/icharacter_service.dart';
import 'package:presentation/page_view_model.dart';

class PageEditorViewModel extends PageViewModel {
  late BuildContext _context;
  late ICharacterService _characterService;
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

  List<IntellisenseData> _intellisenseData = [];
  List<IntellisenseData> get intellisenseData => _intellisenseData;

  bool _isSettingsOpen = false;
  bool get isSettingsOpen => _isSettingsOpen;

  ready(BuildContext context) async {
    _context = context;
    _characterService = getIt.get<ICharacterService>();
    var data =
        await _characterService.getRelatedCharacters(sessionManager.bookId);
    data.map((e) {
      _intellisenseData.add(IntellisenseData(type: 1, value: e.firstName));
      _intellisenseData.add(IntellisenseData(type: 1, value: e.lastName));
    }).toList();

    observer.subscribe("activate_settigs_page", onSettingsPressed);
    observer.subscribe('open_reference_box', onRefBoxRequest);
    notifyListeners();
  }

  onPreviousPagePressed() {}

  double? calculateWidth() {
    var displaySize = MediaQuery.of(_context).size;
    double width = displaySize.width;

    if (width > 1920) {
      return 700;
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
  }

  onRefBoxRequest(GlobalKey key) {
    _popupX = (_pageWidth / 2) - 300;
    _popupY = 180;
    _isSuggestionOpen = true;

    notifyListeners();
  }

  onIntlMenuClosed() {
    _isSuggestionOpen = false;
    notifyListeners();
  }

  onSettingsPressed() {
    _isSettingsOpen = !_isSettingsOpen;
    notifyListeners();
  }

  @override
  void dispose() {
    observer.dispose("activate_settigs_page");
    observer.dispose("open_reference_box");
    super.dispose();
  }
}
