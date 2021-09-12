import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_template/domain/game/constants.dart';
import 'package:flutter_clean_architecture_template/injection.dart';
import 'package:flutter_clean_architecture_template/presentation/pages/game/card_flip_widget.dart';
import 'package:flutter_clean_architecture_template/usecase/game/game_bloc.dart';

class GamePage extends StatelessWidget {
  const GamePage(this.username, {Key? key}) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.125;
    return BlocProvider(
        create: (context) => getIt<GameBloc>(),
        child: Column(
          children: [
            const Text('game time : 00:00:00'),
            Container(
              color: Colors.greenAccent,
              width: MediaQuery.of(context).size.width *0.5,
              padding: const EdgeInsets.all(18),
              child: GridView.count(
                crossAxisCount: 6,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.7,
                shrinkWrap: true,
                children: [
                  for (int index = 0; index < GameConfig.quantity; index++)
                    CardFlipWidget(position: index)
                ],
              ),
            ),
            const Spacer()
          ],
        ));
  }
}
