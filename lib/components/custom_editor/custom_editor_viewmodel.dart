import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class CustomEditorViewModel extends BaseViewModel {
  List<String> _lines = [];
  List<String> get lines => _lines;

  FocusNode _editorNode = FocusNode();
  get editorNode => _editorNode;

  double _opacity = 0;
  double get opacity => _opacity;

  ready() {
    Timer.periodic(
      Duration(milliseconds: 500),
      (timer) {
        _opacity = _opacity == 0.9 ? 0.1 : 0.9;
        notifyListeners();
      },
    );
  }

  actionPressed() {}

  onKeyPressed(RawKeyEvent key) {
    print(key.character);

    if (key.logicalKey.keyLabel == "Enter") {
      if (key is RawKeyDownEvent) {
        _lines.add("");
        notifyListeners();
      }
    }
    if (key.logicalKey.keyLabel == "Backspace") {
      if (_lines.last.isEmpty) {
        _lines.remove(_lines.last);
      }

      if (key is RawKeyDownEvent) {
        if (key.isControlPressed) {
          var zoneList = _lines.last.split(" ").toList();
          var mutated = "";
          zoneList.take(zoneList.length - 2).map((e) {
            mutated += "${e} ";
          }).toList();
          _lines.last = mutated;
        } else {
          _lines.last = _lines.last.substring(0, _lines.last.length - 1);
        }

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

  void editorSelected() {
    _editorNode.requestFocus();
    notifyListeners();
  }
}
