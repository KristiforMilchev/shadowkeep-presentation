import 'package:domain/models/work_item_type.dart';
import 'package:get_it/get_it.dart';
import 'package:infrastructure/interfaces/iworkitem_manager.dart';
import 'package:stacked/stacked.dart';

class WorkItemFilterNavViewModel extends BaseViewModel {
  GetIt getIt = GetIt.I;
  late IWorkItemManager _workItemManager;
  late List<WorkItemType> _types;
  List<WorkItemTypeFilter> _bindingData = [];
  List<WorkItemTypeFilter> get bindingData => _bindingData;
  ready() async {
    _workItemManager = getIt.get<IWorkItemManager>();
    _types = await _workItemManager.getWorkItemTypes();

    _bindingData.addAll(
      _types.map(
        (e) => WorkItemTypeFilter(item: e, selected: true),
      ),
    );

    notifyListeners();
  }

  void onStateChanged(WorkItemTypeFilter e) {
    e.selected = !e.selected;
    _bindingData.where((element) => element.item.id > e.item.id).forEach(
          (element) => element.selected = !element.selected,
        );
    notifyListeners();
  }
}

class WorkItemTypeFilter {
  WorkItemType item;
  bool selected;
  WorkItemTypeFilter({required this.item, required this.selected});
}
