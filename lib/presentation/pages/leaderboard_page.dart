import 'package:flip_flop_game/domain/firebase/entities/player.dart';
import 'package:flip_flop_game/domain/firebase/i_firebase_repository.dart';
import 'package:flip_flop_game/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IFirebaseRepository firebaseRepository = getIt<IFirebaseRepository>();
    return Column(children: [
      const Text("Leaderboard"),
      const Spacer(),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8,
        constraints: const BoxConstraints(minWidth: 80, minHeight: 80),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              for (int idx = 1; idx <= 8; idx++)
                StreamBuilder(
                    stream: firebaseRepository.getPlayersFrom("$idx"),
                    builder: (context, snapshot) {
                      var listPlayer = snapshot.data as List<Player>?;
                      listPlayer = listPlayer ?? List.empty(growable: true);
                      return Container(
                        width: 300,
                        height: 500,
                        margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        color: Colors.blueAccent,
                        child: Column(children: [
                          Text("group $idx"),
                          Row(
                            children: const [
                              Expanded(child: Text("name", textAlign: TextAlign.center)),
                              Expanded(child: Text("score",textAlign: TextAlign.center))
                            ],
                          ),
                          for(Player player in listPlayer)
                            Row(
                              children: [
                                Expanded(child: Text(player.name, textAlign: TextAlign.center)),
                                Expanded(child: Text(player.bestScore.toString(),textAlign: TextAlign.center))
                              ],
                            )


                        ]),
                      );
                    })
            ],
          ),
        ),
      ),
    ]);
  }
}
