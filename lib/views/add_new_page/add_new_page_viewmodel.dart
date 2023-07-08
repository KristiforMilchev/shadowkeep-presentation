import 'package:application/implementations/font_manager.dart';
import 'package:domain/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infrastructure/interfaces/icharacter_service.dart';
import 'package:infrastructure/interfaces/ifont_manager.dart';
import 'package:presentation/page_view_model.dart';

class AddNewPageViewModel extends PageViewModel {
  late BuildContext _context;
  late ICharacterService _characterService;
  late IFontManager _fontManager;

  TextEditingController _controller = TextEditingController();
  get text => _controller;

  //TODO add a AI data model
  List<bool> _aiSuggestions = [];
  List<bool> get aiSuggestionstion => _aiSuggestions;

  List<Character> _mentioned = [];
  List<Character> get mentioned => _mentioned;

  String? _fontLoaded;
  String? get fontLoaded => _fontLoaded;

  ready(BuildContext context) async {
    _context = context;
    await Future.delayed(Duration(seconds: 5), () async {
      _fontManager = FontManager();
      await _fontManager.loadFontFromFile("", "Lobster-Regular");

      _fontLoaded = "Lobster-Regular";
    });
    _characterService = getIt.get<ICharacterService>();
    await loadCharacters();
    notifyListeners();
  }

  Future loadCharacters() async {
    _mentioned =
        await _characterService.getRelatedCharacters(sessionManager.bookId);
  }

  onPromptChanged() {}

  onPromptPressed() {}

  onPreviousPagePressed() {}
}
