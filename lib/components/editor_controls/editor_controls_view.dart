import 'package:domain/models/enums.dart';
import 'package:domain/styles.dart';
import 'package:flutter/gestures.dart';
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
        child: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.start,
          scrollDirection: Axis.horizontal,
          child: Expanded(
            child: Row(
              children: [
                const SizedBox(width: 8),
                CustomIconButton(
                  tooltipMessage: "Undo",
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
                  tooltipMessage: "Redo",
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
                  tooltipMessage: "Save file",
                  solidColor: ThemeStyles.mainColor,
                  icon: const Icon(
                    Icons.save,
                    color: ThemeStyles.actionColor,
                    size: 30,
                  ),
                  label: "",
                  callback: () => viewModel.onCmdPressed(EditorCommand.save),
                ),
                const SizedBox(width: 8),
                CustomIconButton(
                  tooltipMessage: "Copy",
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
                  tooltipMessage: "Paste",
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
                  tooltipMessage: "Insert an image from your device.",
                  solidColor: ThemeStyles.mainColor,
                  icon: const Icon(
                    Icons.image,
                    color: ThemeStyles.actionColor,
                    size: 30,
                  ),
                  label: "",
                  callback: viewModel.onUploadImagePressed,
                ),
                const SizedBox(width: 8),
                CustomIconButton(
                  tooltipMessage: "Text align left",
                  solidColor: ThemeStyles.mainColor,
                  icon: const Icon(
                    Icons.align_horizontal_left,
                    color: ThemeStyles.actionColor,
                    size: 30,
                  ),
                  label: "",
                  callback: () =>
                      viewModel.onCmdPressed(EditorCommand.alightLeft),
                ),
                const SizedBox(width: 8),
                CustomIconButton(
                  tooltipMessage: "Text align center",
                  solidColor: ThemeStyles.mainColor,
                  icon: const Icon(
                    Icons.align_vertical_center,
                    color: ThemeStyles.actionColor,
                    size: 30,
                  ),
                  label: "",
                  callback: () =>
                      viewModel.onCmdPressed(EditorCommand.alignCenter),
                ),
                const SizedBox(width: 8),
                CustomIconButton(
                  tooltipMessage: "Text align right",
                  solidColor: ThemeStyles.mainColor,
                  icon: const Icon(
                    Icons.align_horizontal_right,
                    color: ThemeStyles.actionColor,
                    size: 30,
                  ),
                  label: "",
                  callback: () =>
                      viewModel.onCmdPressed(EditorCommand.alightRight),
                ),
                const SizedBox(width: 8),
                CustomIconButton(
                  tooltipMessage: "Create list 1,2,3",
                  solidColor: ThemeStyles.mainColor,
                  icon: const Icon(
                    Icons.list_alt,
                    color: ThemeStyles.actionColor,
                    size: 30,
                  ),
                  label: "",
                  callback: () =>
                      viewModel.onCmdPressed(EditorCommand.orderedList),
                ),
                const SizedBox(width: 8),
                CustomIconButton(
                  tooltipMessage: "Create bullet list * * *",
                  solidColor: ThemeStyles.mainColor,
                  icon: const Icon(
                    Icons.format_list_bulleted_rounded,
                    color: ThemeStyles.actionColor,
                    size: 30,
                  ),
                  label: "",
                  callback: () =>
                      viewModel.onCmdPressed(EditorCommand.bulletList),
                ),
                const SizedBox(width: 8),
                CustomIconButton(
                  tooltipMessage:
                      "Wraps the selection in double quoutes (Wraps the line in case of selection is empty)",
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
                  tooltipMessage:
                      "Wraps the selection in single quoutes (Wraps the line in case of selection is empty)",
                  solidColor: ThemeStyles.mainColor,
                  icon: const Icon(
                    Icons.format_quote_outlined,
                    color: ThemeStyles.actionColor,
                    size: 30,
                  ),
                  label: "",
                  callback: () =>
                      viewModel.onCmdPressed(EditorCommand.wrapDoubleQuoute),
                ),
                const SizedBox(width: 8),
                CustomIconButton(
                  tooltipMessage: "Bold",
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
                  tooltipMessage: "Underline text",
                  solidColor: ThemeStyles.mainColor,
                  icon: const Icon(
                    Icons.format_underline,
                    color: ThemeStyles.actionColor,
                    size: 30,
                  ),
                  label: "",
                  callback: () =>
                      viewModel.onCmdPressed(EditorCommand.underline),
                ),
                const SizedBox(width: 8),
                CustomIconButton(
                  tooltipMessage: "Selects all the text",
                  solidColor: ThemeStyles.mainColor,
                  icon: const Icon(
                    Icons.select_all,
                    color: ThemeStyles.actionColor,
                    size: 30,
                  ),
                  label: "",
                  callback: () =>
                      viewModel.onCmdPressed(EditorCommand.selectAll),
                ),
                const SizedBox(width: 8),
                CustomIconButton(
                  tooltipMessage: "Deletes the selection or a single character",
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
                CustomIconButton(
                  tooltipMessage: "Opens the document settings",
                  solidColor: ThemeStyles.mainColor,
                  icon: const Icon(
                    Icons.settings,
                    color: ThemeStyles.actionColor,
                    size: 30,
                  ),
                  label: "",
                  callback: viewModel.onSettingsPressed,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
