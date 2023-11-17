import 'package:flutter/foundation.dart';

class LapCalculatorModel extends ChangeNotifier {
  int _totalLaps = 0;
  String _lapTime = "00:00.0";
  String _raceDuration = "00:00:00";
  String _timeLeft = "00:00:00";
  String _totalTime = "00:00:00";

  String get timeLeft => _timeLeft;
  set timeLeft(String value) {
    _timeLeft = value;
    notifyListeners();
  }

  String get totalTime => _totalTime;
  set totalTime(String value) {
    _totalTime = value;
    notifyListeners();
  }

  String get lapTime => _lapTime;
  set lapTime(String value) {
    _lapTime = value;
    notifyListeners();
  }

  String get raceDuration => _raceDuration;
  set raceDuration(String value) {
    _raceDuration = value;
    notifyListeners();
  }

  int get totalLaps => _totalLaps;

  set totalLaps(int value) {
    _totalLaps = value;
    notifyListeners();
  }
}
