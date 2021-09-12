import 'package:flutter_clean_architecture_template/domain/game/entity/player.dart';

abstract class IGameRepository {

  Future savePlayerRecord(Player player);

}