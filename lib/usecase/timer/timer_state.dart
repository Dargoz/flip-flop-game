part of 'timer_bloc.dart';

class TimerState {
  TimerState(
      {required this.seconds,
      required this.minutes,
      required this.hours,
      required this.start,
      required this.isActive});

  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  bool start = false;
  bool isActive = false;
}
