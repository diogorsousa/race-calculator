import 'package:flutter/foundation.dart';

class LapCalculatorModel extends ChangeNotifier {
  int _totalLaps = 0;

  int get totalLaps => _totalLaps;

  set totalLaps(int value) {
    _totalLaps = value;
    notifyListeners();
  }
}
