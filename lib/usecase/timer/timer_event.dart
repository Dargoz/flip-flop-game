part of 'timer_bloc.dart';

@freezed
class TimerEvent with _$TimerEvent {

  factory TimerEvent.tickTimer() = TickTimerEvent;
  factory TimerEvent.stopTimer() = StopTimerEvent;
}