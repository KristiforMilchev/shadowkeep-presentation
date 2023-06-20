import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_editor/custom_editor.dart';
import 'package:presentation/components/custom_icon_button/custom_icon_button.dart';
import 'package:presentation/components/custom_text_field/custom_text_field.dart';
import 'package:presentation/views/add_new_page/add_new_page_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AddNewPageView extends StatelessWidget {
  const AddNewPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AddNewPageViewModel(),
      builder: (context, viewModel, child) => Material(
        color: ThemeStyles.secondaryColor,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Prompt",
                        style: ThemeStyles.innerHeading,
                      ),
                      const Icon(
                        Icons.question_mark_outlined,
                        size: 20,
                        color: ThemeStyles.fontPrimary,
                      )
                    ],
                  ),
                  CustomTextField(
                    height: 300,
                    floatingLabel: "",
                    onChange: viewModel.onPromptChanged,
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
                        callback: viewModel.onPromptPressed,
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
                          color: ThemeStyles.secondaryColor,
                        ),
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text("AI"), Text("GPT4")],
                            ),
                            Text("some AI response"),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Chapter name",
                    style: ThemeStyles.regularHeading,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomIconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: ThemeStyles.actionColor,
                            ),
                            label: "",
                            callback: viewModel.onPreviousPagePressed,
                          ),
                          Text("2"),
                        ],
                      ),
                      Text("3"),
                    ],
                  ),
                  const Expanded(child: CustomEditor())
                ],
              ),
            ),
            Expanded(child: Placeholder())
          ],
        ),
      ),
    );
  }
}
