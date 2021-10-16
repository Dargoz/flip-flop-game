import 'package:firebase_database/firebase_database.dart';
import 'package:flip_flop_game/domain/firebase/i_firebase_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IFirebaseRepository)
class FirebaseRepositoryIml extends IFirebaseRepository {
  final _database = FirebaseDatabase.instance.reference();

  @override
  getConfig() async {
    DataSnapshot dataSnapshot = await _database.child('config').once();
    var data = Map<String, dynamic>.from(dataSnapshot.value);
    print("version : ${data['version']}");
  }

}