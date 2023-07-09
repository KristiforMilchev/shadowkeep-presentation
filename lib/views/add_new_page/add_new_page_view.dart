import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/nav_bar_inner/nav_bar_inner.dart';
import 'package:presentation/views/add_new_page/add_new_page_viewmodel.dart';
import 'package:presentation/views/add_new_page/panels/ai_promp_manager.dart';
import 'package:presentation/views/add_new_page/panels/mentioned_list.dart';
import 'package:presentation/views/add_new_page/panels/page_editor.dart';
import 'package:stacked/stacked.dart';

class AddNewPageView extends StatelessWidget {
  const AddNewPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AddNewPageViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(context),
      builder: (context, viewModel, child) => Material(
        color: ThemeStyles.secondaryColor,
        child: Expanded(
          child: Column(
            children: [
              const NavBarInner(),
              Expanded(
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: AirPromptManager(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: viewModel.applyMargin(),
                        child: const PageEditor(),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: MentionedList(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
