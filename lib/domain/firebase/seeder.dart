

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

    //YUD
    firebaseRepository.updatePlayer(Player('CHN', '3', 0, 0));
    firebaseRepository.updatePlayer(Player('FDY', '3', 0, 0));
    firebaseRepository.updatePlayer(Player('EHS', '3', 0, 0));
    firebaseRepository.updatePlayer(Player('RCH', '3', 0, 0));
    firebaseRepository.updatePlayer(Player('NIF', '3', 0, 0));
    firebaseRepository.updatePlayer(Player('ILEVEN', '3', 0, 0));
    firebaseRepository.updatePlayer(Player('JAP', '3', 0, 0));
    firebaseRepository.updatePlayer(Player('AWR', '3', 0, 0));
    firebaseRepository.updatePlayer(Player('FAN', '3', 0, 0));
    firebaseRepository.updatePlayer(Player('IWP', '3', 0, 0));
    firebaseRepository.updatePlayer(Player('YUD', '3', 0, 0));
    firebaseRepository.updatePlayer(Player('CHR', '3', 0, 0));

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

    //DED
    firebaseRepository.updatePlayer(Player('ODI', '5', 0, 0));
    firebaseRepository.updatePlayer(Player('CLV', '5', 0, 0));
    firebaseRepository.updatePlayer(Player('HUG', '5', 0, 0));
    firebaseRepository.updatePlayer(Player('HJS', '5', 0, 0));
    firebaseRepository.updatePlayer(Player('JWA', '5', 0, 0));
    firebaseRepository.updatePlayer(Player('RNK', '5', 0, 0));
    firebaseRepository.updatePlayer(Player('KEN', '5', 0, 0));
    firebaseRepository.updatePlayer(Player('BEN', '5', 0, 0));
    firebaseRepository.updatePlayer(Player('YUW', '5', 0, 0));
    firebaseRepository.updatePlayer(Player('DED', '5', 0, 0));
    firebaseRepository.updatePlayer(Player('CLS', '5', 0, 0));
    firebaseRepository.updatePlayer(Player('DZR', '5', 0, 0));

    //FDL
    firebaseRepository.updatePlayer(Player('FDL', '6', 0, 0));
    firebaseRepository.updatePlayer(Player('VEN', '6', 0, 0));
    firebaseRepository.updatePlayer(Player('WLM', '6', 0, 0));
    firebaseRepository.updatePlayer(Player('DSW', '6', 0, 0));
    firebaseRepository.updatePlayer(Player('JOH', '6', 0, 0));
    firebaseRepository.updatePlayer(Player('RAB', '6', 0, 0));
    firebaseRepository.updatePlayer(Player('SAP', '6', 0, 0));
    firebaseRepository.updatePlayer(Player('FYE', '6', 0, 0));
    firebaseRepository.updatePlayer(Player('HER', '6', 0, 0));
    firebaseRepository.updatePlayer(Player('ELA', '6', 0, 0));
    firebaseRepository.updatePlayer(Player('HCL', '6', 0, 0));

    //AAD
    firebaseRepository.updatePlayer(Player('AAD', '7', 0, 0));
    firebaseRepository.updatePlayer(Player('BAP', '7', 0, 0));
    firebaseRepository.updatePlayer(Player('PLA', '7', 0, 0));
    firebaseRepository.updatePlayer(Player('AIM', '7', 0, 0));
    firebaseRepository.updatePlayer(Player('ELL', '7', 0, 0));
    firebaseRepository.updatePlayer(Player('MNA', '7', 0, 0));
    firebaseRepository.updatePlayer(Player('KVA', '7', 0, 0));
    firebaseRepository.updatePlayer(Player('WJN', '7', 0, 0));
    firebaseRepository.updatePlayer(Player('RTA', '7', 0, 0));
    firebaseRepository.updatePlayer(Player('ABT', '7', 0, 0));
    firebaseRepository.updatePlayer(Player('SSU', '7', 0, 0));
    firebaseRepository.updatePlayer(Player('VEF', '7', 0, 0));

  }
}