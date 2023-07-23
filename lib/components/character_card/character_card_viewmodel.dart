import 'package:domain/models/character.dart';
import 'package:presentation/page_view_model.dart';

class CharacterCardViewModel extends PageViewModel {
  List<String> _description = ["123", "123", "123", "123"];
  List<String> get description => _description;

  Character? _character;
  Character? get character => _character;

  String _references = "--";
  String get references => _references;

  ready(Character character) {
    _character = character;
    _references = "12";
    notifyListeners();
  }

  onCharacterLoaded(Character current) {}
}
