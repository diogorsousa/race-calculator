class FuelCalculatorService {
  FuelCalculatorService();

  static double calculateFuelRequired(double fuelPerLap, int lapCount) {
    return fuelPerLap * lapCount;
  }
}
