import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:stacked/stacked.dart';

class CustomEditorViewModel extends BaseViewModel {
  List<String> _lines = [];
  List<String> get lines => _lines;

  ready() {}

  actionPressed() {}

  onKeyPressed(RawKeyEvent key) {
    print(key.character);

    if (key.logicalKey.keyLabel == "Enter") {
      _lines.add("");
    }
    if (key.logicalKey.keyLabel == "Backspace") {
      if (_lines.last.isEmpty) {
        _lines.remove(_lines.last);
      }

      if (key is RawKeyDownEvent) {
        _lines.last = _lines.last.substring(0, _lines.last.length - 1);
        notifyListeners();
      }

      return;
    }

    if (key.character != null) {
      if (_lines.isEmpty) _lines.add("");
      lines.last += key.character!;
    }
    notifyListeners();
  }
}
