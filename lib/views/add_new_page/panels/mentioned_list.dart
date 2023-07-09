import 'package:flutter/material.dart';
import 'package:presentation/components/character_card/chracter_card.dart';
import 'package:presentation/views/add_new_page/panels/mentioned_list_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MentionedList extends StatelessWidget {
  const MentionedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MentionedListViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(context),
      builder: (context, viewModel, child) => ListView.builder(
        itemCount: viewModel.mentioned.length,
        itemBuilder: (context, index) => SizedBox(
          height: 500,
          child: CharacterCard(
            character: viewModel.mentioned.elementAt(index),
          ),
        ),
      ),
    );
  }
}
