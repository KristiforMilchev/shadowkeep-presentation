import 'package:domain/models/enums.dart';
import 'package:presentation/page_view_model.dart';

class EditorControlsViewModel extends PageViewModel {
  onCmdPressed(EditorCommand command) {
    observer.getObserver('on_editor_command_passed', command);
  }

  onSettingsPressed() {
    observer.getObserver("activate_settigs_page", null);
  }

  onUploadImagePressed() {}
}
