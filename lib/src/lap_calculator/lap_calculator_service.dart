class LapCalculatorService {
  LapCalculatorService();

  int getTotalLaps(int duration, int lapSeconds) {
    return (duration * 60) ~/ lapSeconds;
  }

  int getTimeRemaining(int duration, int lapSeconds) {
    return (duration * 60) % lapSeconds;
  }
}
