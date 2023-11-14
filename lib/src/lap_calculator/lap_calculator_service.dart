class LapCalculatorService {
  LapCalculatorService();

  static int getTotalLaps(String duration, String averageLap) {
    return (convertDurationToSeconds(duration)) ~/
        convertAverageLapToSeconds(averageLap);
  }

  static int getTimeRemaining(String duration, String averageLap) {
    return (convertDurationToSeconds(duration)) %
        convertAverageLapToSeconds(averageLap);
  }

  static int getTotalTime(String duration, String averageLap) {
    return getTotalLaps(duration, averageLap) *
        convertAverageLapToSeconds(averageLap);
  }

  static int convertDurationToSeconds(String duration) {
    List<String> timeParts = duration.split(':');
    return int.parse(timeParts[0]) * 3600 +
        int.parse(timeParts[1]) * 60 +
        int.parse(timeParts[2]);
  }

  static int convertAverageLapToSeconds(String averageLap) {
    List<String> lapParts = averageLap.split(':');
    int minutes = int.parse(lapParts[0]);
    List<String> secondsAndMilliseconds = lapParts[1].split('.');
    int seconds = int.parse(secondsAndMilliseconds[0]);
    int milliseconds = int.parse(secondsAndMilliseconds[1]);
    return minutes * 60 + seconds + milliseconds ~/ 1000;
  }
}
