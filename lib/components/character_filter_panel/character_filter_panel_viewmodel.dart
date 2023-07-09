import 'package:domain/models/character.dart';
import 'package:domain/models/relational_binding.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/interfaces/icharacter_service.dart';
import 'package:presentation/components/character_avatar/character_avatar.dart';
import 'package:presentation/page_view_model.dart';

class CharacterFilterPanelViewModel extends PageViewModel {
  late BuildContext _context;

  late ICharacterService _characterService;
  List<Character> _characters = [];
  List<Character> get characters => _characters;

  ready(BuildContext context) async {
    _context = context;

    _characterService = getIt.get<ICharacterService>();

    await loadCharacters();
  }

  Future loadCharacters() async {
    _characters =
        await _characterService.getRelatedCharacters(sessionManager.bookId);

    notifyListeners();
    List<RelationalBinding> bindingData = [];
    for (var character in _characters) {
      var related = await _characterService.getEncounters(
        character.id,
        sessionManager.bookId,
      );
      bindingData.add(
        RelationalBinding(
          id: character.id,
          content: CharacterAvatar(character: character),
          related: related
              .map(
                (e) => RelationalBinding(
                  id: e.id,
                  content: CharacterAvatar(character: e),
                ),
              )
              .toList(),
        ),
      );
    }
    observer.getObserver("characterGraph", bindingData);
  }
}
