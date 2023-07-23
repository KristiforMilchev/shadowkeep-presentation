import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/editor_settings_panel/editor_settings_panel_viewmodel.dart';
import 'package:presentation/components/font_dropdown/font_dropdown_view.dart';
import 'package:presentation/components/size_control.dart/size_control.dart';
import 'package:shadowkeep_editor/main.dart';
import 'package:stacked/stacked.dart';

class EditorSettingsPage extends StatelessWidget {
  final double pageWidth;
  const EditorSettingsPage({super.key, required this.pageWidth});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => EditorSettingsPanelViewModel(),
      builder: (context, viewModel, child) => Expanded(
        child: Container(
          color: ThemeStyles.mainColor,
          width: pageWidth,
          child: Stack(
            children: [
              const Expanded(
                flex: 3,
                child: Editor(
                  intellisenseData: [],
                ),
              ),
              Positioned(
                bottom: 0,
                left: pageWidth / 3,
                child: Container(
                  decoration: BoxDecoration(
                    border: const Border(
                      left: BorderSide(
                        color: ThemeStyles.actionColor,
                        width: 1,
                      ),
                      top: BorderSide(
                        color: ThemeStyles.actionColor,
                        width: 1,
                      ),
                      right: BorderSide(
                        color: ThemeStyles.actionColor,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: ThemeStyles.actionColor,
                        width: 0,
                      ),
                    ),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                    color: ThemeStyles.secondaryColor.withAlpha(50),
                  ),
                  width: 600,
                  height: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.margin_rounded,
                              color: ThemeStyles.fontSecondary,
                              size: 30,
                            ),
                            Text(
                              "Page margin",
                              style: ThemeStyles.regularParagraph,
                            ),
                            SizeControl(
                              callbackSizeChanged: viewModel.onMarginChanged,
                              size: viewModel.defaultPageMargin,
                              tooltip: "Set page Margin",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.h_mobiledata,
                              color: ThemeStyles.fontSecondary,
                              size: 30,
                            ),
                            Text(
                              "H1 size",
                              style: ThemeStyles.regularParagraph,
                            ),
                            SizeControl(
                              callbackSizeChanged:
                                  viewModel.onHeadingOneChanged,
                              size: viewModel.defaultHeadingOne,
                              tooltip: "Default H1 size",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.h_mobiledata,
                              color: ThemeStyles.fontSecondary,
                              size: 30,
                            ),
                            Text(
                              "H2 size",
                              style: ThemeStyles.regularParagraph,
                            ),
                            SizeControl(
                              callbackSizeChanged: viewModel.onHeadinTwoChanged,
                              size: viewModel.defaultHeadingTwo,
                              tooltip: "Default H2 size",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.h_mobiledata,
                              color: ThemeStyles.fontSecondary,
                              size: 30,
                            ),
                            Text(
                              "H3 size",
                              style: ThemeStyles.regularParagraph,
                            ),
                            SizeControl(
                              callbackSizeChanged:
                                  viewModel.onHeadinThreeChanged,
                              size: viewModel.defaultHeadingThree,
                              tooltip: "Default H3 size",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.summarize,
                              color: ThemeStyles.fontSecondary,
                              size: 30,
                            ),
                            Text(
                              "Font size",
                              style: ThemeStyles.regularParagraph,
                            ),
                            SizeControl(
                              callbackSizeChanged:
                                  viewModel.defaultFontSizeChanged,
                              size: viewModel.defaultFontSize,
                              tooltip: "Default font size",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.text_snippet,
                                  color: ThemeStyles.fontSecondary,
                                  size: 30,
                                ),
                                const SizedBox(width: 26),
                                Text(
                                  "Default font family",
                                  style: ThemeStyles.regularParagraph,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const FontDropdown(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
