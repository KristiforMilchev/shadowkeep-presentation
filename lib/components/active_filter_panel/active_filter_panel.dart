import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/active_filter_panel/active_filter_panel_viewmodel.dart';
import 'package:presentation/components/custom_button/custom_button.dart';
import 'package:presentation/components/custom_text_field/custom_text_field.dart';
import 'package:stacked/stacked.dart';

class ActiveFilterPanel extends StatelessWidget {
  const ActiveFilterPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ActiveFilterPanelViewModel(),
      builder: (context, viewModel, child) => Container(
        padding: const EdgeInsets.all(20),
        color: ThemeStyles.secondaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: ThemeStyles.actionColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: CustomButton(
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.filter_alt_off,
                              color: ThemeStyles.fontPrimary,
                            ),
                            Text(
                              "Clear all filters",
                              style: ThemeStyles.whiteParagraph,
                            )
                          ],
                        ),
                        callback: viewModel.onClearWordFilters),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  flex: 3,
                  child: CustomTextField(
                    floatingLabel: "",
                    onChange: viewModel.onKeywordChanged,
                    innerButon: CustomButton(
                      widget: const Icon(
                        Icons.subdirectory_arrow_right_rounded,
                        color: ThemeStyles.fontPrimary,
                        size: 25,
                      ),
                      callback: viewModel.onFilterAdded,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: ThemeStyles.mainColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: CustomButton(
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.filter_alt_off,
                              color: ThemeStyles.fontPrimary,
                            ),
                            Text(
                              "Clear words",
                              style: ThemeStyles.whiteParagraph,
                            )
                          ],
                        ),
                        callback: viewModel.onClearWordFilters),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: ThemeStyles.mainColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ThemeStyles.secondaryColor,
                      ),
                      child: Text(
                        "Nirvanaasdasdsasddsasad",
                        style: ThemeStyles.whiteParagraph,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ThemeStyles.secondaryColor,
                      ),
                      child: Text(
                        "223123213",
                        style: ThemeStyles.whiteParagraph,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
