part of 'game_bloc.dart';

class GameState {
  GameState({required this.showFrontSide,
    required this.openedCardPosition,
    this.openedCardCount = 0,
    this.animationEndCount = 0,
    this.allowUserAction = true,
    this.wrong = false});

  List<bool> showFrontSide = List.filled(18, false);
  List<int> openedCardPosition = List.empty(growable: true);
  int openedCardCount;
  int animationEndCount;
  bool allowUserAction;
  bool wrong;
}
