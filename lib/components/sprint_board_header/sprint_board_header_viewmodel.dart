import 'package:domain/models/board.dart';
import 'package:presentation/page_view_model.dart';

class SprintBoardHeaderViewModel extends PageViewModel {
  List<Board> _boards = [];
  List<Board> get boards => _boards;

  ready() async {
    _boards = await workItemManager.getProjectBoards(sessionManager.projectId);
    notifyListeners();
  }

  String sumRemaining(id) {
    return 120.toString();
  }
}
