import 'package:domain/models/enums.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_icon_button/custom_icon_button.dart';
import 'package:presentation/components/font_size_controls/font_size_controls_viewmodel.dart';
import 'package:stacked/stacked.dart';

class FontSizeControls extends StatelessWidget {
  const FontSizeControls({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => FontSizeControlsViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(),
      builder: (context, viewModel, child) => Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: ThemeStyles.mainColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Row(children: [
          CustomIconButton(
            tooltipMessage: "Decreases the font size",
            solidColor: ThemeStyles.mainColor,
            icon: const Icon(
              Icons.remove,
              color: ThemeStyles.actionColor,
              size: 30,
            ),
            label: "",
            callback: () => viewModel.executeCommand(EditorCommand.decreseFont),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: ThemeStyles.mainColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
              ),
            ),
            child: Text(
              viewModel.activeFontSize,
              style: ThemeStyles.regularParagraph,
            ),
          ),
          CustomIconButton(
            tooltipMessage: "Increase the font size",
            solidColor: ThemeStyles.mainColor,
            icon: const Icon(
              Icons.add,
              color: ThemeStyles.actionColor,
              size: 30,
            ),
            label: "",
            callback: () =>
                viewModel.executeCommand(EditorCommand.increaseFont),
          ),
        ]),
      ),
    );
  }
}
