import 'package:flutter/material.dart';
import 'package:presentation/components/custom_editor/custom_editor_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CustomEditor extends StatelessWidget {
  const CustomEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CustomEditorViewModel(),
      builder: (context, viewModel, child) => RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (value) => viewModel.onKeyPressed(value),
        child: Column(
          children: viewModel.lines
              .map(
                (e) => Text(e),
              )
              .toList(),
        ),
      ),
    );
  }
}
