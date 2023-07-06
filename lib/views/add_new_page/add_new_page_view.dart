import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/views/add_new_page/add_new_page_viewmodel.dart';
import 'package:presentation/views/add_new_page/panels/ai_promp_manager.dart';
import 'package:presentation/views/add_new_page/panels/page_editor.dart';
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
            AirPromptManager(vm: viewModel),
            PageEditor(vm: viewModel),
            const Expanded(
              child: Placeholder(),
            )
          ],
        ),
      ),
    );
  }
}
