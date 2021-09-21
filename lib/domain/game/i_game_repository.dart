import 'package:flip_flop_game/domain/game/entity/player.dart';

abstract class IGameRepository {

  Future savePlayerRecord(Player player);

}