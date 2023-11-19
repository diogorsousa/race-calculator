class FuelCalculatorService {
  FuelCalculatorService();

  static double calculateFuelRequired(double fuelPerLap, int lapCount) {
    return double.parse((fuelPerLap * lapCount).toStringAsFixed(1));
  }

  static int calculatePitstops(double fuelRequired, double tankSize) {
    return (fuelRequired + 1) ~/ tankSize;
  }
}
