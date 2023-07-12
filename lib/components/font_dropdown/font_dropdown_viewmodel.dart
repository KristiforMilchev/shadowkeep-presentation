import 'package:application/implementations/font_manager.dart';
import 'package:domain/models/font_changed_request.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/interfaces/ifont_manager.dart';
import 'package:presentation/page_view_model.dart';

class FontDropdownViewModel extends PageViewModel {
  late IFontManager _fontManager;
  late BuildContext _context;

  List<({Widget content, String key})> _fonts = [];
  List<({Widget content, String key})> get getFonts => _fonts;

  String _selectedFont = "FiraCode";
  get selectedFont => _selectedFont;

  ready(BuildContext context) async {
    _context = context;
    _fontManager = FontManager();
    var getFonts = await _fontManager.getFonts();
    for (var element in getFonts) {
      _fonts.add((
        content: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            element,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 12,
              fontFamily: element,
              color: ThemeStyles.fontPrimary,
            ),
          ),
        ),
        key: element,
      ));
    }

    _selectedFont = _fonts.first.key;
    notifyListeners();
  }

  onChanged(String value) {
    _selectedFont = value;
    observer.getObserver(
      'change_font_family',
      FontChangeRequest(fontName: value, context: _context),
    );
    notifyListeners();
  }
}
