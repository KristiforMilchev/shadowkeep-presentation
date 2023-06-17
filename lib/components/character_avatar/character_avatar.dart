import 'package:domain/models/character.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';

class CharacterAvatar extends StatelessWidget {
  final Character character;
  const CharacterAvatar({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ThemeStyles.mainColor,
        shape: BoxShape.circle,
      ),
      child: Column(
        children: [
          const Icon(
            Icons.account_circle_outlined,
            color: ThemeStyles.fontPrimary,
            size: 32,
          ),
          const SizedBox(height: 16),
          Text(
            character.firstName,
            style: ThemeStyles.innerHeading,
          ),
        ],
      ),
    );
  }
}
