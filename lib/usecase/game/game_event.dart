part of 'game_bloc.dart';

@freezed
class GameEvent with _$GameEvent {
  factory GameEvent.onGameStart() = GameStart;
  factory GameEvent.onTapCard(int position, String cardIdentity) = GameTapCard;
  factory GameEvent.onValidate() = GameValidate;
  factory GameEvent.onAnimationStatus(AnimationStatus status) = GameAnimationStatus;
  factory GameEvent.onGameEnd() = GameEnd;
}