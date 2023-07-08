import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:presentation/page_view_model.dart';

class FontDropdownViewModel extends PageViewModel {
  get activeFont => "Lotto Normal";

  List<({Widget content, String key})> _fonts = [];
  List<({Widget content, String key})> get getFonts => _fonts;

  ready() {
    var i = 0;
    _fonts.add(
      (
        content: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            GoogleFonts.aBeeZee.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: GoogleFonts.getFont(GoogleFonts.aBeeZee.toString()),
          ),
        ),
        key: GoogleFonts.aBeeZee.toString(),
      ),
    );
    notifyListeners();
  }

  onChanged() {}
}
