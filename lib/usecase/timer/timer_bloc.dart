import 'dart:async';

import 'package:flip_flop_game/usecase/game/game_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'timer_event.dart';

part 'timer_state.dart';

part 'timer_bloc.freezed.dart';

@injectable
class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final GameBloc _gameBloc;
  int seconds = 0;

  TimerBloc(this._gameBloc)
      : super(TimerState(
            seconds: 0, minutes: 0, hours: 0, start: true, isActive: false)) {
    _gameBloc.stream.listen((event) {});
  }

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    yield* event.map(tickTimer: (startTimer) async* {
      state.seconds = ++seconds % 60;
      state.minutes = seconds ~/ 60;
      state.hours = seconds ~/ 3600;
      yield TimerState(
          seconds: state.seconds,
          minutes: state.minutes,
          hours: state.hours,
          start: true,
          isActive: true);
    }, stopTimer: (stopTimer) async* {
      yield TimerState(
          seconds: state.seconds,
          minutes: state.minutes,
          hours: state.hours,
          start: false,
          isActive: false);
    });
  }
}
