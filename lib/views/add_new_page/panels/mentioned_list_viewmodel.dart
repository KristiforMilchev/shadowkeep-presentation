import 'package:domain/models/character.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/interfaces/icharacter_service.dart';

import 'package:presentation/page_view_model.dart';

class MentionedListViewModel extends PageViewModel {
  late BuildContext _context;
  late ICharacterService _characterService;

  List<Character> _mentioned = [];
  List<Character> get mentioned => _mentioned;

  ready(BuildContext context) async {
    _context = context;
    _characterService = getIt.get<ICharacterService>();
    await loadCharacters();
    notifyListeners();
  }

  Future loadCharacters() async {
    _mentioned =
        await _characterService.getRelatedCharacters(sessionManager.bookId);
  }
}
