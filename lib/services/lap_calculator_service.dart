class LapCalculatorService {
  LapCalculatorService();

  static int getTotalLaps(String duration, String averageLap) {
    int totalLaps = (convertDurationToSeconds(duration)) ~/
        convertAverageLapToSeconds(averageLap);
    if (getTimeRemaining(duration, averageLap) != "00:00:00") {
      totalLaps++;
    }
    return totalLaps;
  }

  static String getTimeRemaining(String duration, String averageLap) {
    int remainingSeconds = (convertDurationToSeconds(duration)) %
        convertAverageLapToSeconds(averageLap);
    return convertTotalTimeToString(remainingSeconds);
  }

  static String getTotalTime(String duration, String averageLap) {
    return convertTotalTimeToString(getTotalLaps(duration, averageLap) *
        convertAverageLapToSeconds(averageLap));
  }

  // hrs:min:sec to seconds
  static int convertDurationToSeconds(String duration) {
    List<String> timeParts = duration.split(':');
    return int.parse(timeParts[0]) * 3600 +
        int.parse(timeParts[1]) * 60 +
        int.parse(timeParts[2]);
  }

  // min:sec.ms to sec
  static int convertAverageLapToSeconds(String averageLap) {
    List<String> lapParts = averageLap.split(':');
    int minutes = int.parse(lapParts[0]);
    List<String> secondsAndMilliseconds = lapParts[1].split('.');
    int seconds = int.parse(secondsAndMilliseconds[0]);
    int milliseconds = int.parse(secondsAndMilliseconds[1]);
    return minutes * 60 + seconds + milliseconds ~/ 1000;
  }

  // seconds to hrs:min:sec
  static String convertTotalTimeToString(int totalTime) {
    int hours = totalTime ~/ 3600;
    totalTime %= 3600;
    int minutes = totalTime ~/ 60;
    int seconds = totalTime % 60;
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}
