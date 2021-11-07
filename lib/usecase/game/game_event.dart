part of 'game_bloc.dart';

@freezed
class GameEvent with _$GameEvent {
  factory GameEvent.onGameStart(int renderedPosition) = GameStart;
  factory GameEvent.onTapCard(int position, String cardIdentity) = GameTapCard;
  factory GameEvent.onValidate() = GameValidate;
  factory GameEvent.onAnimationStatus(int position, AnimationStatus status) = GameAnimationStatus;
  factory GameEvent.onGameEnd(Player player, int sore) = GameEnd;
}