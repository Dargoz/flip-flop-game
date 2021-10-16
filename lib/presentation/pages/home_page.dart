import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flip_flop_game/domain/game/entity/game.dart';
import 'package:flip_flop_game/domain/game/entity/game_properties.dart';
import 'package:flip_flop_game/domain/game/usecases/game_use_case.dart';
import 'package:flip_flop_game/injection.dart';
import 'package:flip_flop_game/presentation/navigation/app_route.gr.dart';
import 'package:flip_flop_game/usecase/feedback/feedback_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return BlocProvider(
        create: (context) => getIt<FeedbackBloc>(),
        child: Scaffold(
          /*appBar: AppBar(
          title: Text('Feedback'),
        ),*/
          body: Center(
            child: Column(
              children: [
                const Spacer(),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Column(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            createNewGame(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                            child: Text(
                              localizations.start,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            context.navigateTo(const LeaderboardRoute());
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                            child: Text(
                              localizations.leaderboard,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                          child: Text(
                            localizations.about,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(32),
                  child: Text("Created with ♥ and ☕ by DRG"),
                ),
              ],
            ),
          ),
        ));
  }

  void createNewGame(BuildContext context) async {
    GameUseCase gameUseCase = getIt<GameUseCase>();
    print('game use case : $gameUseCase');
    Game game = await gameUseCase.executeUseCase(GameProperties(seed: 1));
    context.navigateTo(GameRoute(username: 'DRG', game: game));
  }
}
