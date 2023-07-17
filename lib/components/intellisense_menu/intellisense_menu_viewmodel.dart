import 'package:collection/collection.dart';
import 'package:domain/models/intellisense_data.dart';
import 'package:infrastructure/interfaces/icharacter_service.dart';
import 'package:presentation/page_view_model.dart';

class IntellisenseViewModel extends PageViewModel {
  late ICharacterService _characterService;
  List<({int id, String name, int type})> _intellisenseData = [];
  List<({int id, String name, int type})> _intellisenseDataFiltered = [];
  List<({int id, String name, int type})> get intellisenseData =>
      _intellisenseDataFiltered;

  ready() async {
    _characterService = getIt.get<ICharacterService>();

    var characters =
        await _characterService.getRelatedCharacters(sessionManager.bookId);

    _intellisenseData.addAll(
      characters.map(
        (e) {
          ({int id, String name, int type}) data =
              (id: e.id, name: e.firstName, type: 1);
          return data;
        },
      ),
    );

    _intellisenseDataFiltered = _intellisenseData;
    notifyListeners();
  }

  onSearchChanged(String value) {
    if (value.isEmpty) {
      _intellisenseDataFiltered = _intellisenseData;
      notifyListeners();
      return;
    }

    _intellisenseDataFiltered = _intellisenseData
        .where((element) => element.name.contains(value))
        .toList();
    notifyListeners();
  }

  void insertSelection(int id) {
    var selectedValue =
        _intellisenseData.firstWhereOrNull((element) => element.id == id);
    //TODO add business rules
    if (selectedValue == null) return;

    observer.getObserver(
      "intellisense_selected",
      IntellisenseData(type: selectedValue.type, value: selectedValue.name),
    );
  }
}
