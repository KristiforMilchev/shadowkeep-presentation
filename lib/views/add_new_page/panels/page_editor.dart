import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_icon_button/custom_icon_button.dart';
import 'package:presentation/components/editor_controls/editor_controls_view.dart';
import 'package:presentation/components/editor_settings_panel/editor_settings_panel.dart';
import 'package:presentation/components/font_dropdown/font_dropdown_view.dart';
import 'package:presentation/components/font_size_controls/font_size_controls_view.dart';
import 'package:presentation/components/intellisense_menu/intellisense_menu.dart';
import 'package:presentation/views/add_new_page/panels/page_editor_viewmodel.dart';
import 'package:shadowkeep_editor/main.dart';
import 'package:stacked/stacked.dart';

class PageEditor extends StatelessWidget {
  const PageEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PageEditorViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(context),
      builder: (context, viewModel, child) => Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Chapter name",
                style: ThemeStyles.regularParagraphOv(
                  weight: FontWeight.w600,
                  size: 40,
                  color: ThemeStyles.fontPrimary,
                ),
              ),
              const SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: ThemeStyles.mainColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: CustomIconButton(
                      tooltipMessage: "Go to previous page",
                      solidColor: ThemeStyles.mainColor,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: ThemeStyles.actionColor,
                        size: 30,
                      ),
                      label: "2",
                      callback: viewModel.onPreviousPagePressed,
                    ),
                  ),
                  Row(
                    children: [
                      const FontDropdown(),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: viewModel.calculateWidth(),
                        child: const EditorControls(),
                      ),
                      const SizedBox(width: 16),
                      const FontSizeControls(),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: ThemeStyles.mainColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                      ),
                    ),
                    child: CustomIconButton(
                      tooltipMessage: "Open next page",
                      solidColor: ThemeStyles.mainColor,
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: ThemeStyles.actionColor,
                        size: 30,
                      ),
                      label: "3",
                      callback: viewModel.onPreviousPagePressed,
                    ),
                  ),
                ],
              ),
              Container(
                height: 35,
                width: double.infinity,
                color: ThemeStyles.mainColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 22,
                      color: ThemeStyles.actionColor,
                      width: viewModel.pageWidth,
                      child: GestureDetector(
                        onHorizontalDragUpdate: (details) =>
                            viewModel.dragUpdated(details),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                viewModel.pageWidth.toString(),
                                style: ThemeStyles.whiteParagraph,
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              if (!viewModel.isSettingsOpen)
                Expanded(
                  child: Container(
                    color: ThemeStyles.mainColor,
                    width: viewModel.pageWidth,
                    child: Editor(intellisenseData: viewModel.intellisenseData),
                  ),
                ),
              if (viewModel.isSettingsOpen)
                EditorSettingsPage(pageWidth: viewModel.pageWidth)
            ],
          ),
          if (viewModel.isSuggestionOpen)
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: ThemeStyles.secondaryColor,
                ),
                width: 600,
                height: 300,
                child: IntellisenseMenu(
                  actionTaken: viewModel.onIntlMenuClosed,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
