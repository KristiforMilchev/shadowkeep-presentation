import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_icon_button/custom_icon_button.dart';
import 'package:presentation/views/add_new_page/add_new_page_viewmodel.dart';
import 'package:shadowkeep_editor/main.dart';

class PageEditor extends StatelessWidget {
  final AddNewPageViewModel vm;
  const PageEditor({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    solidColor: ThemeStyles.mainColor,
                    icon: const Icon(
                      Icons.arrow_back,
                      color: ThemeStyles.actionColor,
                    ),
                    label: "",
                    callback: vm.onPreviousPagePressed,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "2",
                    style: ThemeStyles.regularParagraph,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "2",
                    style: ThemeStyles.regularParagraph,
                  ),
                  const SizedBox(width: 8),
                  CustomIconButton(
                    solidColor: ThemeStyles.mainColor,
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: ThemeStyles.actionColor,
                    ),
                    label: "",
                    callback: vm.onPreviousPagePressed,
                  ),
                ],
              )
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
