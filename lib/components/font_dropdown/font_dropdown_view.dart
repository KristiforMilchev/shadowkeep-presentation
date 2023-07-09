import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_dropdown/custoom_dropdown_view.dart';
import 'package:presentation/components/font_dropdown/font_dropdown_viewmodel.dart';
import 'package:stacked/stacked.dart';

class FontDropdown extends StatelessWidget {
  const FontDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => FontDropdownViewModel(),
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
        foregroundDecoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: CustomDropdown(
          onChanged: viewModel.onChanged,
          buttonDecoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          dropdownDecoration: BoxDecoration(color: ThemeStyles.mainColor),
          maxHeight: 400,
          dropdownHeight: 400,
          dropdownWidth: 300,
          buttonHeight: 30,
          iconEnabledColor: ThemeStyles.fontPrimary,
          icon: const Icon(
            Icons.arrow_drop_down,
            size: 22,
          ),
          content: viewModel.getFonts,
          hint: "Pick a font",
          value: viewModel.selectedFont,
        ),
      ),
    );
  }
}
