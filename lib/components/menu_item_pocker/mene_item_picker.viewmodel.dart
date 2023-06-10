import 'package:domain/models/dropdown_item.dart';
import 'package:stacked/stacked.dart';

class MenuItemPickerViewModel extends BaseViewModel {
  List<DropdownItem> _items = [];
  DropdownItem? _itemSelected;

  List<DropdownItem> get items => _items;
  DropdownItem? get itemSelected => _itemSelected;

  onProjectSelected(int? value) {
    _itemSelected = _items.firstWhere((element) => element.id == value);
    notifyListeners();
  }

  ready(List<DropdownItem> bindingData) {
    _items = bindingData;
    _itemSelected = _items.first;
    notifyListeners();
  }
}
