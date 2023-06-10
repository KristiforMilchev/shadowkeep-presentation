import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends BaseViewModel {
  double _splashAnimation = 0;
  get splashAnimation => _splashAnimation;
  Timer? _timer;
  late Function _finished;

  ready(Function callback) {
    _finished = callback;
    Timer.periodic(const Duration(milliseconds: 50), (t) {
      if (_splashAnimation <= 0.9) _splashAnimation += 0.02;

      if (_splashAnimation >= 0.9) {
        t.cancel();
        _finished.call();
      }

      notifyListeners();
    });
  }
}
