part of 'game_bloc.dart';

class GameState {
  GameState(
      {required this.showFrontSide,
      required this.openedCardPosition,
      required this.cardPair,
      this.openedCardCount = 0,
      this.animationEndCount = 0,
      this.correct = 0,
      this.allowUserAction = true,
      this.wrong = false,
      this.gameEnd = false});

  List<bool> showFrontSide = List.filled(18, false);
  List<int> openedCardPosition = List.empty(growable: true);
  List<String> cardPair = List.filled(2, "");
  int openedCardCount;
  int animationEndCount;
  int correct;
  bool allowUserAction;
  bool wrong;
  bool gameEnd;
}
