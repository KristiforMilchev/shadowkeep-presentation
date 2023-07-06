import 'package:domain/models/enums.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_icon_button/custom_icon_button.dart';
import 'package:presentation/components/editor_controls/editor_controls_viewmodel.dart';
import 'package:stacked/stacked.dart';

class EditorControls extends StatelessWidget {
  const EditorControls({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => EditorControlsViewModel(),
      builder: (context, viewModel, child) => Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: ThemeStyles.mainColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            CustomIconButton(
              solidColor: ThemeStyles.mainColor,
              icon: const Icon(
                Icons.undo,
                color: ThemeStyles.actionColor,
                size: 30,
              ),
              label: "",
              callback: () => viewModel.onCmdPressed(EditorCommand.undo),
            ),
            const SizedBox(width: 8),
            CustomIconButton(
              solidColor: ThemeStyles.mainColor,
              icon: const Icon(
                Icons.redo,
                color: ThemeStyles.actionColor,
                size: 30,
              ),
              label: "",
              callback: () => viewModel.onCmdPressed(EditorCommand.redo),
            ),
            const SizedBox(width: 8),
            CustomIconButton(
              solidColor: ThemeStyles.mainColor,
              icon: const Icon(
                Icons.copy,
                color: ThemeStyles.actionColor,
                size: 30,
              ),
              label: "",
              callback: () => viewModel.onCmdPressed(EditorCommand.copy),
            ),
            const SizedBox(width: 8),
            CustomIconButton(
              solidColor: ThemeStyles.mainColor,
              icon: const Icon(
                Icons.paste,
                color: ThemeStyles.actionColor,
                size: 30,
              ),
              label: "",
              callback: () => viewModel.onCmdPressed(EditorCommand.paste),
            ),
            const SizedBox(width: 8),
            CustomIconButton(
              solidColor: ThemeStyles.mainColor,
              icon: const Icon(
                Icons.align_horizontal_left,
                color: ThemeStyles.actionColor,
                size: 30,
              ),
              label: "",
              callback: () => viewModel.onCmdPressed(EditorCommand.alightLeft),
            ),
            const SizedBox(width: 8),
            CustomIconButton(
              solidColor: ThemeStyles.mainColor,
              icon: const Icon(
                Icons.align_vertical_center,
                color: ThemeStyles.actionColor,
                size: 30,
              ),
              label: "",
              callback: () => viewModel.onCmdPressed(EditorCommand.alignCenter),
            ),
            const SizedBox(width: 8),
            CustomIconButton(
              solidColor: ThemeStyles.mainColor,
              icon: const Icon(
                Icons.align_horizontal_right,
                color: ThemeStyles.actionColor,
                size: 30,
              ),
              label: "",
              callback: () => viewModel.onCmdPressed(EditorCommand.alightRight),
            ),
            const SizedBox(width: 8),
            CustomIconButton(
              solidColor: ThemeStyles.mainColor,
              icon: const Icon(
                Icons.list_alt,
                color: ThemeStyles.actionColor,
                size: 30,
              ),
              label: "",
              callback: () => viewModel.onCmdPressed(EditorCommand.orderedList),
            ),
            const SizedBox(width: 8),
            CustomIconButton(
              solidColor: ThemeStyles.mainColor,
              icon: const Icon(
                Icons.format_list_bulleted_rounded,
                color: ThemeStyles.actionColor,
                size: 30,
              ),
              label: "",
              callback: () => viewModel.onCmdPressed(EditorCommand.bulletList),
            ),
            const SizedBox(width: 8),
            CustomIconButton(
              solidColor: ThemeStyles.mainColor,
              icon: const Icon(
                Icons.format_quote,
                color: ThemeStyles.actionColor,
                size: 30,
              ),
              label: "",
              callback: () =>
                  viewModel.onCmdPressed(EditorCommand.wrapDoubleQuoute),
            ),
            const SizedBox(width: 8),
            CustomIconButton(
              solidColor: ThemeStyles.mainColor,
              icon: const Icon(
                Icons.format_bold,
                color: ThemeStyles.actionColor,
                size: 30,
              ),
              label: "",
              callback: () => viewModel.onCmdPressed(EditorCommand.bold),
            ),
            const SizedBox(width: 8),
            CustomIconButton(
              solidColor: ThemeStyles.mainColor,
              icon: const Icon(
                Icons.format_underline,
                color: ThemeStyles.actionColor,
                size: 30,
              ),
              label: "",
              callback: () => viewModel.onCmdPressed(EditorCommand.underline),
            ),
            const SizedBox(width: 8),
            CustomIconButton(
              solidColor: ThemeStyles.mainColor,
              icon: const Icon(
                Icons.select_all,
                color: ThemeStyles.actionColor,
                size: 30,
              ),
              label: "",
              callback: () => viewModel.onCmdPressed(EditorCommand.selectAll),
            ),
            const SizedBox(width: 8),
            CustomIconButton(
              solidColor: ThemeStyles.mainColor,
              icon: const Icon(
                Icons.delete_sweep_rounded,
                color: ThemeStyles.actionColor,
                size: 30,
              ),
              label: "",
              callback: () => viewModel.onCmdPressed(EditorCommand.delete),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
