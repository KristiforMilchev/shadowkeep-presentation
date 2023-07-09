import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_icon_button/custom_icon_button.dart';
import 'package:presentation/components/editor_controls/editor_controls_view.dart';
import 'package:presentation/components/font_dropdown/font_dropdown_view.dart';
import 'package:presentation/components/font_size_controls/font_size_controls_view.dart';
import 'package:presentation/views/add_new_page/panels/page_editor_viewmodel.dart';
import 'package:shadowkeep_editor/main.dart';
import 'package:stacked/stacked.dart';

class PageEditor extends StatelessWidget {
  const PageEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PageEditorViewModel(),
      builder: (context, viewModel, child) => Column(
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
              const Row(
                children: [
                  FontDropdown(),
                  SizedBox(width: 16),
                  EditorControls(),
                  SizedBox(width: 16),
                  FontSizeControls(),
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
          Expanded(
            child: Scaffold(
              backgroundColor: ThemeStyles.mainColor,
              body: const Editor(),
            ),
          )
        ],
      ),
    );
  }
}
