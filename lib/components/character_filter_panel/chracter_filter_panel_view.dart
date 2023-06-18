import 'package:flutter/material.dart';
import 'package:presentation/components/active_filter_panel/active_filter_panel.dart';
import 'package:presentation/components/character_card/chracter_card.dart';
import 'package:presentation/components/character_filter_panel/character_filter_panel_viewmodel.dart';
import 'package:presentation/components/relation_graph/relational_graph_view.dart';
import 'package:stacked/stacked.dart';

class CharacterFilterPanel extends StatelessWidget {
  const CharacterFilterPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CharacterFilterPanelViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(context),
      builder: (context, viewModel, child) => Row(
        children: [
          const Expanded(
            child: RelationalGraphView(
              orintation: Axis.vertical,
              observable: "characterGraph",
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.characters.length,
              itemBuilder: (context, index) => SizedBox(
                height: 500,
                child: CharacterCard(
                  character: viewModel.characters.elementAt(index),
                ),
              ),
            ),
          ),
          const Expanded(
            child: ActiveFilterPanel(),
          ),
        ],
      ),
    );
  }
}
