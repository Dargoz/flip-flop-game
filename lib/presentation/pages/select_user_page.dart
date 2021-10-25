import 'package:auto_route/auto_route.dart';
import 'package:flip_flop_game/domain/firebase/entities/player.dart';
import 'package:flip_flop_game/domain/firebase/i_firebase_repository.dart';
import 'package:flip_flop_game/domain/game/entity/game.dart';
import 'package:flip_flop_game/domain/game/entity/game_properties.dart';
import 'package:flip_flop_game/domain/game/usecases/game_use_case.dart';
import 'package:flip_flop_game/presentation/navigation/app_route.gr.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class SelectUserPage extends StatelessWidget {
  const SelectUserPage({Key? key, required this.groupId}) : super(key: key);

  final String groupId;

  @override
  Widget build(BuildContext context) {
    IFirebaseRepository firebaseRepository = getIt<IFirebaseRepository>();
    Player player = Player("UND", '09', 0, 0);
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Column(
            children: [
              const Spacer(),
              const Center(
                child: Text(
                  'Select Your Initial',
                  style: TextStyle(
                      color: Color.fromARGB(200, 69, 69, 69),
                      fontSize: 36,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              ),
              StreamBuilder(
                  stream: firebaseRepository.getPlayersFrom(groupId),
                  builder: (context, AsyncSnapshot<List<Player>?> snapshot) {
                    List<Player> playerList =
                        snapshot.data ?? List.empty(growable: true);
                    if (playerList.isNotEmpty) {
                      player = playerList[0];
                    }

                    return DropdownButton<Player>(
                      value: player,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      alignment: AlignmentDirectional.center,
                      underline: const SizedBox(),
                      itemHeight: 120,
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (Player? newValue) {
                        player = newValue!;
                      },
                      items: playerList
                          .map<DropdownMenuItem<Player>>((Player value) {
                        return DropdownMenuItem<Player>(
                          value: value,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              value.name,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }),
              MaterialButton(
                onPressed: () {
                  createNewGame(context, player.name);
                },
                child: const Text("Let's Goo'", style: TextStyle(
                  fontSize: 24,
                ),),
              ),
              const Spacer(),
            ],
          ),
        );
      }),
    );
  }

  void createNewGame(BuildContext context, String username) async {
    GameUseCase gameUseCase = getIt<GameUseCase>();
    Game game = await gameUseCase
        .executeUseCase(GameProperties(seed: int.parse(groupId)));
    context.navigateTo(GameRoute(username: username, game: game));
  }
}
