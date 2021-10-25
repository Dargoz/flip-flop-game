import 'dart:async';

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flip_flop_game/presentation/navigation/app_route.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flip_flop_game/domain/game/constants.dart';
import 'package:flip_flop_game/domain/game/entity/game.dart';
import 'package:flip_flop_game/injection.dart';
import 'package:flip_flop_game/presentation/pages/game/card_flip_widget.dart';
import 'package:flip_flop_game/usecase/game/game_bloc.dart';
import 'package:flip_flop_game/usecase/timer/timer_bloc.dart';

class GamePage extends StatelessWidget {
  GamePage({Key? key, required this.username, required this.game})
      : super(key: key);

  final String username;
  final Game game;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt<GameBloc>()),
            BlocProvider(create: (context) => getIt<TimerBloc>()),
          ],
          child: Center(
              child: Column(
            children: [
              Container(
                child: BlocConsumer<TimerBloc, TimerState>(
                  listener: (context, state) {
                    if (!state.start) {
                      timer?.cancel();
                      context.navigateTo(ResultRoute(score: "${state.score}"));
                    }
                  },
                  builder: (context, state) {
                    if (!state.isActive) {
                      timer =
                          Timer.periodic(const Duration(seconds: 1), (timer) {
                        BlocProvider.of<TimerBloc>(context)
                            .add(TimerEvent.tickTimer());
                      });
                    }
                    return Text(
                        'game time ${state.hours}:${state.minutes}:${state.seconds}');
                  },
                ),
              ),
              const Spacer(),
              Container(
                constraints: const BoxConstraints(minWidth: 100, maxWidth: 800),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.9,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      for (int index = 0; index < GameConfig.quantity; index++)
                        SizedBox(
                          width: 120,
                          height: 180,
                          child: CardFlipWidget(
                            position: index,
                            frontAsset: game.assetPaths[index],
                            rearAsset: 'resources/cover/card_design.png',
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ))),
    );
  }
}
