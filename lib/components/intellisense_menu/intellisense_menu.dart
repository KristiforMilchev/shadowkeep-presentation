import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_button/custom_button.dart';
import 'package:presentation/components/custom_text_field/custom_text_field.dart';
import 'package:presentation/components/intellisense_menu/intellisense_menu_viewmodel.dart';
import 'package:stacked/stacked.dart';

class IntellisenseMenu extends StatelessWidget {
  final Function actionTaken;
  const IntellisenseMenu({super.key, required this.actionTaken});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => IntellisenseViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(),
      builder: (context, viewModel, child) => Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomTextField(
              floatingLabel: "Search",
              onChange: viewModel.onSearchChanged,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.intellisenseData.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(10),
                  color: ThemeStyles.mainColor,
                  child: CustomButton(
                    callback: () {
                      viewModel.insertSelection(
                          viewModel.intellisenseData.elementAt(index).id);
                      actionTaken.call();
                    },
                    widget: Column(
                      children: [
                        Text(
                          "Character",
                          style: ThemeStyles.innerHeading,
                        ),
                        Row(
                          children: [
                            Text(
                              viewModel.intellisenseData.elementAt(index).name,
                              style: ThemeStyles.whiteParagraph,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
