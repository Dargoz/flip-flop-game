import 'package:firebase_database/firebase_database.dart';
import 'package:flip_flop_game/domain/firebase/entities/config.dart';
import 'package:flip_flop_game/domain/firebase/entities/player.dart';
import 'package:flip_flop_game/domain/firebase/i_firebase_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IFirebaseRepository)
class FirebaseRepositoryIml extends IFirebaseRepository {
  final _database = FirebaseDatabase.instance.reference();

  @override
  Stream<Config> getConfig() {
    final configStream = _database.child('config').onValue;
    final streamToPublish = configStream.map((event) {
      return Config.fromJson(event.snapshot.value);
    });
    return streamToPublish;
  }

  @override
  Future<Player?> getPlayer(String name) async {
    DataSnapshot dataSnapshot = await _database.child('players/$name').once();
    if (dataSnapshot.exists) {
      var data = Map<String, dynamic>.from(dataSnapshot.value);
      return Player.fromJson(data);
    } else {
      return null;
    }
  }

  @override
  Stream<List<Player>> getPlayersFrom(String group) {
    final playerStream = _database.child('players').onValue;
    final streamPublish = playerStream.map((event) {
      var data = Map<String, dynamic>.from(event.snapshot.value);
      data.removeWhere(
          (key, value) => Map<String, dynamic>.from(value)['group'] != group);
      final playerList = data.entries
          .map((element) => Player.fromJson(element.value))
          .toList();
      playerList.sort(
          (player1, player2) => player1.bestScore.compareTo(player2.bestScore));
      return playerList;
    });
    return streamPublish;
  }

  @override
  updatePlayer(Player player) async {
    await _database.child('players/${player.name}').update(player.toJson());
  }
}
