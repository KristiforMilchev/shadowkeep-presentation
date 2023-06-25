import 'package:flutter/material.dart';
import 'package:presentation/page_view_model.dart';

class AddNewPageViewModel extends PageViewModel {
  get editorController => null;

  get editorTabController => null;

  TextEditingController _controller = TextEditingController();
  get text => _controller;

  get quill => null;

  onPromptChanged() {}

  onPromptPressed() {}

  onPreviousPagePressed() {}
}
