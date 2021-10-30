import 'package:flip_flop_game/domain/firebase/entities/player.dart';
import 'package:flip_flop_game/domain/firebase/i_firebase_repository.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flip_flop_game/domain/game/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'game_event.dart';

part 'game_state.dart';

part 'game_bloc.freezed.dart';

@singleton
class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc(this._firebaseRepository)
      : super(GameState(
            showFrontSide: List.filled(GameConfig.quantity, false),
            openedCardPosition: List.empty(growable: true),
            cardPair: List.filled(2, "")));

  final IFirebaseRepository _firebaseRepository;

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    yield* event.map(
        onGameStart: (onGameStart) async* {},
        onTapCard: (onTapCard) async* {
          print("openCard count : ${state.openedCardCount}");
          int openCount = 0;
          if (state.allowUserAction) {
            state.cardPair[state.openedCardCount] = onTapCard.cardIdentity;
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
              if (!state.wrong) {
                state.correct++;
                reset();
              }
              if (state.correct == GameConfig.quantity / 2) {
                state.gameEnd = true;
              }
              yield _copyWith();
            } else if (state.animationEndCount == 4) {
              reset();
              yield _copyWith();
            }
          }
        },
        onValidate: (GameValidate value) async* {},
        onGameEnd: (onGameEnd) async* {
          Player player = onGameEnd.player;
          if(player.firstScore == 0) {
            player.firstScore = onGameEnd.sore;
          }
          if(player.bestScore == 0 || player.bestScore > onGameEnd.sore) {
            player.bestScore = onGameEnd.sore;
          }
          _firebaseRepository.updatePlayer(player);
        });
  }

  void validate() {
    print(
        "opened Card List : ${state.openedCardPosition.length} :: ${state.openedCardPosition}");
    print("onValidate : ${state.showFrontSide}");
    var identity1 = state.cardPair[0].split('-')[0];
    var identity2 = state.cardPair[1].split('-')[0];
    print('identity1 : $identity1 == identity2 : $identity2');
    state.wrong = identity1 != identity2;
  }

  GameState _copyWith() {
    return GameState(
        showFrontSide: state.showFrontSide,
        openedCardPosition: state.openedCardPosition,
        cardPair: state.cardPair,
        openedCardCount: state.openedCardCount,
        animationEndCount: state.animationEndCount,
        correct: state.correct,
        allowUserAction: state.allowUserAction,
        wrong: state.wrong,
        gameEnd: state.gameEnd);
  }


  void reset() {
    state.openedCardCount = 0;
    state.animationEndCount = 0;
    state.allowUserAction = true;
    state.wrong = false;
    state.showFrontSide = List.filled(GameConfig.quantity, false);
  }
}
