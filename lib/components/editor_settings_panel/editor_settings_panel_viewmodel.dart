import 'package:stacked/stacked.dart';

class EditorSettingsPanelViewModel extends BaseViewModel {
  int _defaultPageMargin = 50;
  int get defaultPageMargin => _defaultPageMargin;

  int _defaultHeadingOne = 24;
  int get defaultHeadingOne => _defaultHeadingOne;

  int _defaultHeadingTwo = 19;
  get defaultHeadingTwo => _defaultHeadingTwo;

  int _defaultHeadingThree = 16;
  get defaultHeadingThree => _defaultHeadingThree;

  int _defaultFontSize = 14;
  get defaultFontSize => _defaultFontSize;

  onMarginChanged(int size) {
    _defaultPageMargin = size;
  }

  onHeadingOneChanged(int size) {
    _defaultHeadingOne = size;
  }

  onHeadinTwoChanged(int size) {
    _defaultHeadingTwo = size;
  }

  onHeadinThreeChanged(size) {
    _defaultHeadingThree = size;
  }

  defaultFontSizeChanged(int size) {
    _defaultFontSize = size;
  }
}
