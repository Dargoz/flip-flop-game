part of 'game_bloc.dart';

class GameState {
  GameState(
      {required this.showFrontSide,
      required this.openedCardPosition,
      required this.cardPair,
      this.openedCardCount = 0,
      this.animationEndCount = 0,
      this.correct = 0,
      this.renderCount = 0,
      this.initLoading = true,
      this.allowUserAction = true,
      this.wrong = false,
      this.gameEnd = false});

  List<bool> showFrontSide = List.filled(18, false);
  List<int> openedCardPosition = List.empty(growable: true);
  List<String> cardPair = List.filled(2, "");
  int openedCardCount;
  int animationEndCount;
  int correct;
  int renderCount;
  bool initLoading;
  bool allowUserAction;
  bool wrong;
  bool gameEnd;
}
