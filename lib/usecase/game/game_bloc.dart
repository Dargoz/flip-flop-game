import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_template/domain/game/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'game_event.dart';

part 'game_state.dart';

part 'game_bloc.freezed.dart';

@injectable
class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc()
      : super(GameState(
            showFrontSide: List.filled(GameConfig.quantity, false),
            openedCardPosition: List.empty(growable: true)));

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    yield* event.map(
        onGameStart: (onGameStart) async* {},
        onTapCard: (onTapCard) async* {
          print("openCard count : ${state.openedCardCount}");
          int openCount = 0;
          if (state.allowUserAction) {
            openCount = ++state.openedCardCount;
            state.showFrontSide[onTapCard.position] =
                !state.showFrontSide[onTapCard.position];
            state.openedCardPosition.add(onTapCard.position);
          }

          if (openCount == GameConfig.maxOpenedCard) {
            print("openCard reach : 2");
            state.allowUserAction = false;
            yield _copyWith();
          }
        },
        onAnimationStatus: (GameAnimationStatus animationStatus) async* {
          print("status called ${animationStatus.status}");
          if (animationStatus.status == AnimationStatus.dismissed) {
            state.animationEndCount++;
            print("on ${animationStatus.status} : ${state.animationEndCount}");
            if (state.animationEndCount == 2) {
              validate();
              yield _copyWith();
            } else if (state.animationEndCount == 4) {}
          }
        },
        onValidate: (GameValidate value) async* {},
        onGameEnd: (onGameEnd) async* {});
  }

  void validate() {

    print("opened Card List : ${state.openedCardPosition.length} :: ${state.openedCardPosition}");
    print("onValidate : ${state.showFrontSide}");
    state.wrong = true;
  }

  GameState _copyWith() {
    return GameState(
        showFrontSide: state.showFrontSide,
        openedCardPosition: state.openedCardPosition,
        openedCardCount: state.openedCardCount,
        animationEndCount: state.animationEndCount,
        allowUserAction: state.allowUserAction,
        wrong: state.wrong);
  }

  void _replaceState(GameState gameState) {
    state.showFrontSide = gameState.showFrontSide;
    state.openedCardCount = gameState.openedCardCount;
    state.animationEndCount = gameState.animationEndCount;
    state.allowUserAction = gameState.allowUserAction;
    state.wrong = gameState.wrong;
  }
}
