import 'package:flip_flop_game/domain/firebase/entities/config.dart';
import 'package:flip_flop_game/domain/firebase/entities/player.dart';

abstract class IFirebaseRepository {
  Stream<Config> getConfig();
  updatePlayer(Player player);
  Future<Player?> getPlayer(String name);
  Stream<List<Player>> getPlayersFrom(String group);
}
