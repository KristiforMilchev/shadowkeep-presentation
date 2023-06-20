import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_editor/custom_editor_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CustomEditor extends StatelessWidget {
  const CustomEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CustomEditorViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(),
      builder: (context, viewModel, child) => InkWell(
        onTap: viewModel.editorSelected,
        child: Flexible(
          child: Container(
            width: 1100,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ThemeStyles.mainColor),
            child: RawKeyboardListener(
              focusNode: viewModel.editorNode,
              onKey: (value) => viewModel.onKeyPressed(value),
              child: Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: viewModel.lines
                      .map(
                        (e) => viewModel.lines.last == e
                            ? Row(
                                children: [
                                  Flexible(
                                    child: Column(
                                      children: [
                                        Text(
                                          e,
                                          style: ThemeStyles.regularParagraph,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Opacity(
                                    opacity: viewModel.opacity,
                                    child: Text(
                                      "|",
                                      style: ThemeStyles.regularParagraph,
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                e,
                                style: ThemeStyles.regularParagraph,
                              ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
