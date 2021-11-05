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
  int seconds = 180;
  bool gameEnd = false;

  TimerBloc(this._gameBloc)
      : super(TimerState(
            seconds: 0,
            minutes: 0,
            hours: 0,
            score: 0,
            start: true,
            pause: true,
            isActive: false)) {
    _gameBloc.stream.listen((event) {
      print("game bloc event : ${event.renderCount}");
      if(!event.initLoading) {
        print('start the GAMEEEEE');
        state.pause = false;
      }
      gameEnd = event.gameEnd;
      print("game bloc event : ${event.gameEnd}");
    });
  }

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    yield* event.map(tickTimer: (startTimer) async* {
      if (gameEnd) {
        yield TimerState(
            seconds: state.seconds,
            minutes: state.minutes,
            hours: state.hours,
            score: state.score,
            start: false,
            pause: state.pause,
            isActive: true);
      } else {
        if(!state.pause) {
          state.seconds = --seconds % 60;
          state.minutes = seconds ~/ 60;
          state.hours = seconds ~/ 3600;
          state.score = seconds;
          yield TimerState(
              seconds: state.seconds,
              minutes: state.minutes,
              hours: state.hours,
              score: state.score,
              start: true,
              pause: state.pause,
              isActive: true);
        }
      }
    }, stopTimer: (stopTimer) async* {
      yield TimerState(
          seconds: state.seconds,
          minutes: state.minutes,
          hours: state.hours,
          score: state.score,
          start: false,
          pause: state.pause,
          isActive: false);
    });
  }
}
