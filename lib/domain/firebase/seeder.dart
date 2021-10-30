

import 'package:flip_flop_game/domain/firebase/entities/player.dart';
import 'package:flip_flop_game/domain/firebase/i_firebase_repository.dart';

class PlayerSeeder {
  static void seed(IFirebaseRepository firebaseRepository) {
    //SWN
    firebaseRepository.updatePlayer(Player('SWN', '1', 0, 0));
    firebaseRepository.updatePlayer(Player('MAC', '1', 0, 0));
    firebaseRepository.updatePlayer(Player('YNT', '1', 0, 0));
    firebaseRepository.updatePlayer(Player('MMY', '1', 0, 0));
    firebaseRepository.updatePlayer(Player('EBK', '1', 0, 0));
    firebaseRepository.updatePlayer(Player('ROS', '1', 0, 0));
    firebaseRepository.updatePlayer(Player('AIL', '1', 0, 0));
    firebaseRepository.updatePlayer(Player('DST', '1', 0, 0));
    firebaseRepository.updatePlayer(Player('DLB', '1', 0, 0));
    firebaseRepository.updatePlayer(Player('WLS', '1', 0, 0));
    firebaseRepository.updatePlayer(Player('NDA', '1', 0, 0));

    //DRG
    firebaseRepository.updatePlayer(Player('TON', '2', 0, 0));
    firebaseRepository.updatePlayer(Player('LDO', '2', 0, 0));
    firebaseRepository.updatePlayer(Player('LCD', '2', 0, 0));
    firebaseRepository.updatePlayer(Player('LUX', '2', 0, 0));
    firebaseRepository.updatePlayer(Player('RPT', '2', 0, 0));
    firebaseRepository.updatePlayer(Player('SND', '2', 0, 0));
    firebaseRepository.updatePlayer(Player('SIN', '2', 0, 0));
    firebaseRepository.updatePlayer(Player('APW', '2', 0, 0));
    firebaseRepository.updatePlayer(Player('SHANNEN', '2', 0, 0));
    firebaseRepository.updatePlayer(Player('OKH', '2', 0, 0));
    firebaseRepository.updatePlayer(Player('DIT', '2', 0, 0));

    //WTM
    firebaseRepository.updatePlayer(Player('ADY', '4', 0, 0));
    firebaseRepository.updatePlayer(Player('LRV', '4', 0, 0));
    firebaseRepository.updatePlayer(Player('EBN', '4', 0, 0));
    firebaseRepository.updatePlayer(Player('GLG', '4', 0, 0));
    firebaseRepository.updatePlayer(Player('DMD', '4', 0, 0));
    firebaseRepository.updatePlayer(Player('REYHAN', '4', 0, 0));
    firebaseRepository.updatePlayer(Player('JNF', '4', 0, 0));
    firebaseRepository.updatePlayer(Player('THI', '4', 0, 0));
    firebaseRepository.updatePlayer(Player('TIK', '4', 0, 0));
    firebaseRepository.updatePlayer(Player('PLN', '4', 0, 0));

  }
}