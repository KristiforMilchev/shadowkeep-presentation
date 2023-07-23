import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_icon_button/custom_icon_button.dart';
import 'package:presentation/components/custom_text_field/custom_text_field.dart';

import 'package:presentation/views/add_new_page/panels/ai_promp_manager_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AirPromptManager extends StatelessWidget {
  const AirPromptManager({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AiPromptManagerViewModel(),
      builder: (context, viewModel, child) => Column(
        children: [
          SizedBox(
            child: CustomTextField(
              lineConstaint: 10,
              floatingLabel: "Enter your prompt",
              onChange: viewModel.onPromptChanged,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: ThemeStyles.mainColor,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: CustomIconButton(
                  solidColor: ThemeStyles.mainColor,
                  icon: const Icon(
                    Icons.cloud_circle,
                    color: ThemeStyles.actionColor,
                    size: 30,
                  ),
                  label: "Generate",
                  callback: viewModel.onPromptPressed,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Visibility(
              visible: viewModel.aiSuggestionstion.isNotEmpty,
              replacement: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: ThemeStyles.mainColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.cloud_off,
                      color: ThemeStyles.fontPrimary,
                      size: 40,
                    ),
                    Text(
                      "It's empty here",
                      style: ThemeStyles.regularHeading,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              child: ListView.builder(
                itemCount: viewModel.aiSuggestionstion.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ThemeStyles.mainColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "some AI response",
                          style: ThemeStyles.regularParagraph,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: ThemeStyles.secondaryColor,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.cloud_sync_sharp,
                                  color: ThemeStyles.fontPrimary,
                                  size: 24,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "AI",
                                  style: ThemeStyles.innerHeading,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: ThemeStyles.secondaryColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "view details",
                                  style:
                                      ThemeStyles.innerHeadingOv(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: ThemeStyles.secondaryColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Apply",
                                  style:
                                      ThemeStyles.innerHeadingOv(fontSize: 20),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 24,
                                  color: ThemeStyles.fontPrimary,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
