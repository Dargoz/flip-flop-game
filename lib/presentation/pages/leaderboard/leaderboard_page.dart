import 'package:flip_flop_game/domain/firebase/entities/player.dart';
import 'package:flip_flop_game/domain/firebase/i_firebase_repository.dart';
import 'package:flip_flop_game/domain/game/constants.dart';
import 'package:flip_flop_game/domain/leaderboard/leaderboard_constants.dart';
import 'package:flip_flop_game/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IFirebaseRepository firebaseRepository = getIt<IFirebaseRepository>();
    return Scaffold(
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          constraints: const BoxConstraints(minWidth: 80, minHeight: 80),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("Leaderboard", style: TextStyle(
                    fontFamily: 'PokemonSolid',
                    fontSize: 36,
                  ),),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    for (int idx = 0; idx < GameConfig.hmac.length - 1; idx++)
                      StreamBuilder(
                          stream: firebaseRepository.getPlayersFrom("${idx + 1}"),
                          builder: (context, snapshot) {
                            var listPlayer = snapshot.data as List<Player>?;
                            listPlayer = listPlayer ?? List.empty(growable: true);
                            return Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                                Container(
                                  width: 300,
                                  height: 600,
                                  margin: const EdgeInsets.fromLTRB(16, 48, 16, 16),
                                  decoration: BoxDecoration(
                                      color:
                                      LeaderboardConstant.style[idx].boardColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16))),
                                  child: Column(children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(24, 12, 24, 12),
                                      child: Row(
                                        children: const [
                                          Expanded(
                                              child: Text(
                                                "name",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold),
                                              )),
                                          Expanded(
                                            child: Text(
                                              "score",
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    for (Player player in listPlayer)
                                      if (player.bestScore != 0)
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              16, 8, 16, 8),
                                          decoration: BoxDecoration(
                                              color: LeaderboardConstant
                                                  .style[idx].rowColor,
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(8))),
                                          child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(player.name,
                                                          textAlign:
                                                          TextAlign.start,
                                                          style: const TextStyle(
                                                              color: Color.fromARGB(225, 255, 255, 255),
                                                              fontSize: 18,
                                                              fontWeight: FontWeight
                                                                  .bold))),
                                                  Expanded(
                                                      child: Text(
                                                          player.bestScore
                                                              .toString(),
                                                          textAlign: TextAlign.end,
                                                          style: const TextStyle(
                                                              color: Color.fromARGB(225, 255, 255, 255),
                                                              fontSize: 18,
                                                              fontWeight:
                                                              FontWeight.bold)))
                                                ],
                                              )),
                                        )
                                  ]),
                                ),
                                Image.asset(
                                    "resources/pokemon/${GameConfig.pokemon[GameConfig.hmac[idx]]}.png",
                                    scale: 5)
                              ],
                            );
                          })
                  ],
                ),
              ],
            )
          ),
        ),
      ]),
    );
  }
}
