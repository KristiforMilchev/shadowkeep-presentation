import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_editor/custom_editor_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CustomEditor extends StatelessWidget {
  const CustomEditor({
    super.key,
    this.editorStyle,
  });
  final EditorStyle? editorStyle;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CustomEditorViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(),
      builder: (context, viewModel, child) => Container(
        width: 1100,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => viewModel.formatHeading(1),
                  child: Text("h1", style: ThemeStyles.regularParagraph),
                ),
                const SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () => viewModel.formatHeading(2),
                  child: Text("h2", style: ThemeStyles.regularParagraph),
                ),
                const SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () => viewModel.formatHeading(3),
                  child: Text("h3", style: ThemeStyles.regularParagraph),
                ),
                const SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () => viewModel.formatQuoute(),
                  child: Text("\"\"", style: ThemeStyles.regularParagraph),
                )
              ],
            ),
            Expanded(
              child: AppFlowyEditor.standard(
                editorStyle: EditorStyle.desktop(
                  padding: const EdgeInsets.all(10),
                  backgroundColor: ThemeStyles.mainColor,
                  selectionColor: ThemeStyles.fontSecondary,
                  cursorColor: ThemeStyles.actionColor,
                  textStyleConfiguration: TextStyleConfiguration(
                    bold: const TextStyle(
                      color: ThemeStyles.fontPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    text: const TextStyle(
                      color: ThemeStyles.fontPrimary,
                    ),
                    underline: TextStyle(
                      color: ThemeStyles.fontPrimary.withAlpha(25),
                    ),
                  ),
                ),
                editorState: viewModel.getEditorState(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
