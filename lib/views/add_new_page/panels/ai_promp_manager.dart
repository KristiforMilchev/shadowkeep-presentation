import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_icon_button/custom_icon_button.dart';
import 'package:presentation/components/custom_text_field/custom_text_field.dart';
import 'package:presentation/views/add_new_page/add_new_page_viewmodel.dart';

class AirPromptManager extends StatelessWidget {
  final AddNewPageViewModel vm;
  const AirPromptManager({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            child: CustomTextField(
              floatingLabel: "Enter your prompt",
              onChange: vm.onPromptChanged,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                icon: const Icon(
                  Icons.cloud_sync_sharp,
                  color: ThemeStyles.actionColor,
                  size: 20,
                ),
                label: "Generate",
                callback: vm.onPromptPressed,
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 25,
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
                                style: ThemeStyles.innerHeadingOv(fontSize: 20),
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
                                style: ThemeStyles.innerHeadingOv(fontSize: 20),
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
          )
        ],
      ),
    );
  }
}
