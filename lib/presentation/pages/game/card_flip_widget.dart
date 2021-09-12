import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_template/domain/game/constants.dart';
import 'package:flutter_clean_architecture_template/usecase/game/game_bloc.dart';

class CardFlipWidget extends StatefulWidget {
  const CardFlipWidget({Key? key, this.position = undefined}) : super(key: key);

  static const int undefined = -1;
  final int position;

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardFlipWidget> {
  late bool _showFrontSide;
  late bool _flipXAxis;
  bool _userClick = false;
  bool _allowAction = true;

  @override
  void initState() {
    super.initState();
    _showFrontSide = false;
    _flipXAxis = true;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
      child: Center(
        child: Container(
          child: _buildFlipAnimation(),
        ),
      ),
    );
  }

  void _changeRotationAxis() {
    setState(() {
      _flipXAxis = !_flipXAxis;
    });
  }

  void _onTapCard() {
    _userClick = true;
    _openCard();
  }

  void _openCard() {
    BlocProvider.of<GameBloc>(context)
        .add(GameEvent.onTapCard(widget.position));
    if (_allowAction) {
      setState(() {
        _showFrontSide = true;
      });
    }
  }

  void _closeCard() {
      _showFrontSide = false;
  }

  Widget _buildFlipAnimation() {
    return BlocConsumer<GameBloc, GameState>(
        listener: (context, state) {},
        builder: (context, state) {
          _allowAction = state.openedCardCount != GameConfig.maxOpenedCard;
          if (state.wrong && state.showFrontSide[widget.position]) {
            _closeCard();
          }
          return GestureDetector(
            onTap: _onTapCard,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: __transitionBuilder,
              layoutBuilder: (widget, list) =>
                  Stack(children: [widget!, ...list]),
              child: _showFrontSide ? _buildFront() : _buildRear(),
              switchInCurve: Curves.easeInBack,
              switchOutCurve: Curves.easeInBack.flipped,
            ),
          );
        });
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    animation.addStatusListener((status) {
      if (_userClick) {
        BlocProvider.of<GameBloc>(context)
            .add(GameEvent.onAnimationStatus(status));
      }
    });
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget!.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: _flipXAxis
              ? (Matrix4.rotationY(value)..setEntry(3, 0, tilt))
              : (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  Widget _buildFront() {
    return Container(
      key: const ValueKey(true),
      child: Image.asset('resources/pack1/davin_image.png'),
    );
  }

  Widget _buildRear() {
    return Container(
      key: const ValueKey(false),
      child: Image.asset('resources/cover/card_rear_bg.png'),
    );
  }

  Widget __buildLayout(
      {required Key key,
      required Widget child,
      required String faceName,
      required Color backgroundColor}) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        color: backgroundColor,
      ),
      child: Center(
        child: Text(faceName.substring(0, 1),
            style: const TextStyle(fontSize: 80.0)),
      ),
    );
  }
}
