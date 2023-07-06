import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_button/custom_button.dart';
import 'package:presentation/components/custom_icon_button/custom_icon_button.dart';
import 'package:presentation/components/font_dropdown/font_dropdown_viewmodel.dart';
import 'package:stacked/stacked.dart';

class FontDropdown extends StatelessWidget {
  const FontDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => FontDropdownViewModel(),
      builder: (context, viewModel, child) => Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: ThemeStyles.mainColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: CustomButton(
          widget: Row(
            children: [
              const Icon(
                Icons.font_download,
                color: ThemeStyles.actionColor,
                size: 30,
              ),
              const SizedBox(width: 8),
              Text(
                viewModel.activeFont,
                style: ThemeStyles.regularParagraph,
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_drop_down_rounded,
                color: ThemeStyles.actionColor,
                size: 30,
              ),
            ],
          ),
          callback: viewModel.openFontDropdown,
        ),
      ),
    );
  }
}
