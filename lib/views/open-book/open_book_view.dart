import 'package:flutter/material.dart';
import 'package:presentation/components/bottom_nav_bar/bottom_nav_bar_view.dart';
import 'package:presentation/components/character_filter_panel/chracter_filter_panel_view.dart';
import 'package:presentation/components/relation_graph/relational_graph_view.dart';
import 'package:presentation/views/open-book/open_book_viewmodel.dart';
import 'package:stacked/stacked.dart';

class OpenBookView extends StatelessWidget {
  const OpenBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => OpenBookViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(context),
      builder: (context, viewModel, child) => const Material(
        child: Column(
          children: [
            NavBar(
              barContent: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            ),
            Expanded(
              child: CharacterFilterPanel(),
            ),
            Expanded(
              flex: 2,
              child: RelationalGraphView(
                orintation: Axis.horizontal,
                observable: "chapterGraph",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
