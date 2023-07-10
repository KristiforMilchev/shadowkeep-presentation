import 'package:domain/models/enums.dart';
import 'package:presentation/page_view_model.dart';

class FontSizeControlsViewModel extends PageViewModel {
  String _activeFontSize = "14";
  String get activeFontSize => _activeFontSize;
  ready() {
    observer.subscribe('line_number_size_updated', lineNumberSizeChanged);
  }

  executeCommand(EditorCommand editorCommand) {
    observer.getObserver('on_editor_command_passed', editorCommand);
  }

  lineNumberSizeChanged(int size) {
    _activeFontSize = size.toString();
    notifyListeners();
  }

  @override
  void dispose() {
    observer.dispose('line_number_size_updated');
    super.dispose();
  }
}
