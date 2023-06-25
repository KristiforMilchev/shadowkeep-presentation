import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CustomEditorViewModel extends BaseViewModel {
  EditorState _state = EditorState.blank();
  EditorState get state => _state;

  FocusNode _editorNode = FocusNode();
  FocusNode get editorNode => _editorNode;

  ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  ready() {
    _editorNode.requestFocus();
  }

  void onEditorSelected() {
    _editorNode.requestFocus();
  }

  void onEditorStateChange(EditorState editorState) {}

  formatHeading(int level) {
    final node = state.getNodeAtPath(state.selection!.start.path)!;
    final isHighlight =
        node.type == 'heading' && node.attributes['level'] == level;
    state.formatNode(
      state.selection,
      (node) => node.copyWith(
        type: isHighlight ? ParagraphBlockKeys.type : HeadingBlockKeys.type,
        attributes: {
          HeadingBlockKeys.level: level,
          HeadingBlockKeys.backgroundColor:
              node.attributes[blockComponentBackgroundColor],
          'delta': (node.delta ?? Delta()).toJson(),
        },
      ),
    );
  }

  formatQuoute() {
    final node = state.getNodeAtPath(state.selection!.start.path)!;
    final isHighlight = node.type == 'quote';

    state.formatNode(
      state.selection,
      (node) => node.copyWith(
        type: isHighlight ? 'paragraph' : 'quote',
        attributes: {
          'delta': (node.delta ?? Delta()).toJson(),
        },
      ),
    );
  }

  getEditorState() {
    _state = EditorState.blank();
    return _state;
  }
}
