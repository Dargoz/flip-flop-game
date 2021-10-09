import 'dart:async';

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
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<GameBloc>()),
          BlocProvider(create: (context) => getIt<TimerBloc>()),
        ],
        child: Column(
          children: [
            Container(
              child: BlocConsumer<TimerBloc, TimerState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (!state.isActive) {
                    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                      BlocProvider.of<TimerBloc>(context)
                          .add(TimerEvent.tickTimer());
                    });
                  }
                  return Text(
                      'game time ${state.hours}:${state.minutes}:${state.seconds}');
                },
              ),
            ),
            Container(
              color: Colors.greenAccent,
              width: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.all(18),
              child: GridView.count(
                crossAxisCount: 6,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.7,
                shrinkWrap: true,
                children: [
                  for (int index = 0; index < GameConfig.quantity; index++)
                    CardFlipWidget(
                      position: index,
                      frontAsset: game.assetPaths[index],
                      rearAsset: 'resources/cover/card_design.png',
                    )
                ],
              ),
            ),
            const Spacer()
          ],
        ));
  }
}
