import 'package:flutter/material.dart';
import 'package:presentation/components/character_card/chracter_card.dart';
import 'package:presentation/views/add_new_page/add_new_page_viewmodel.dart';

class MentionedList extends StatelessWidget {
  final AddNewPageViewModel vm;
  const MentionedList({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: vm.mentioned.length,
        itemBuilder: (context, index) => SizedBox(
          height: 500,
          child: CharacterCard(
            character: vm.mentioned.elementAt(index),
          ),
        ),
      ),
    );
  }
}
