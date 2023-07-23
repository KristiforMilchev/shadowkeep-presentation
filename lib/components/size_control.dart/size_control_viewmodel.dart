import 'package:stacked/stacked.dart';

class SizeControlViewModel extends BaseViewModel {
  late Function _callback;

  int _size = 0;
  String get currentSize => _size.toString();

  ready(Function callbackSizeChanged, int size) {
    _callback = callbackSizeChanged;
    _size = size;
  }

  onSizeDecreased() {
    _size--;
    _callback.call(_size);
    notifyListeners();
  }

  onSizeIncreased() {
    _size--;
    _callback.call(_size);
    notifyListeners();
  }
}
