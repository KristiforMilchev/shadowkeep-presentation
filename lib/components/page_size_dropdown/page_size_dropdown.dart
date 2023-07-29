import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_dropdown/custoom_dropdown_view.dart';
import 'package:presentation/components/page_size_dropdown/page_size_dropdown_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PageSizeDropdown extends StatelessWidget {
  final double? width;
  final double? maxHeight;
  const PageSizeDropdown({super.key, required this.width, this.maxHeight});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PageSizeDropdownViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(context),
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
          buttonWidth: width,
          maxHeight: maxHeight ?? 200,
          dropdownHeight: maxHeight ?? 200,
          dropdownWidth: width ?? 300,
          buttonHeight: 30,
          iconEnabledColor: ThemeStyles.fontPrimary,
          icon: const Icon(
            Icons.arrow_drop_down,
            size: 22,
          ),
          content: viewModel.pages,
          hint: "Pick a font",
          value: viewModel.pageSize,
        ),
      ),
    );
  }
}
