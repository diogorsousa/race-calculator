import 'package:flutter/foundation.dart';

class FuelCalculatorModel extends ChangeNotifier {
  double _fuelPerLap = 0.0;
  int _tankCapacity = 0;
  double _fuelRequired = 0.0;
  int _pitstops = 0;

  double get fuelPerLap => _fuelPerLap;

  int get pitstops => _pitstops;
  set pitstops(int value) {
    _pitstops = value;
    notifyListeners();
  }

  set fuelPerLap(double value) {
    _fuelPerLap = value;
    notifyListeners();
  }

  int get tankCapacity => _tankCapacity;
  set tankCapacity(int value) {
    _tankCapacity = value;
    notifyListeners();
  }

  double get fuelRequired => _fuelRequired;
  set fuelRequired(double value) {
    _fuelRequired = value;
    notifyListeners();
  }
}
