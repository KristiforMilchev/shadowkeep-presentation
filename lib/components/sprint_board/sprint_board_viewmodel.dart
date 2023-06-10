import 'package:domain/models/sprint.dart';
import 'package:domain/models/work_item.dart';
import 'package:presentation/page_view_model.dart';

class SprintBoardViewModel extends PageViewModel {
  late List<WorkItem> _workItems = [];
  List<WorkItem> get workItems => _workItems;

  String _name = "";
  String get name => _name;

  String _estimatedCost = "";
  String get estimatedCost => _estimatedCost;

  String _topic = "";
  get topic => _topic;

  Sprint? _sprint;

  ready(int id) async {
    _sprint = await sprintManager.getSprint(id);
    _workItems = _sprint?.stories ?? [];
    _name = _sprint?.identifier ?? "";
    _estimatedCost = "0";
    _topic = _sprint?.topic ?? "";
    observer.subscribe("sprint_board_card_added_$id", onSprintBoardCardAdded);
    notifyListeners();
  }

  onSprintBoardCardAdded(WorkItem item) {
    _sprint?.stories ??= [];
    _sprint?.stories!.add(item);
    _workItems = _sprint?.stories ?? [];
    notifyListeners();
  }
}
