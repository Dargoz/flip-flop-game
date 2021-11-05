part of 'timer_bloc.dart';

class TimerState {
  TimerState(
      {required this.seconds,
      required this.minutes,
      required this.hours,
      required this.score,
      required this.start,
      required this.pause,
      required this.isActive});

  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  int score = 0;
  bool start = false;
  bool pause = true;
  bool isActive = false;
}
