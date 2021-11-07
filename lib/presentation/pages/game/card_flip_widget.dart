import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flip_flop_game/usecase/game/game_bloc.dart';

class CardFlipWidget extends StatefulWidget {
  const CardFlipWidget(
      {Key? key,
      this.position = undefined,
      required this.frontAsset,
      required this.rearAsset})
      : super(key: key);

  static const int undefined = -1;
  final int position;
  final String frontAsset;
  final String rearAsset;

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardFlipWidget> {
  late bool _showFrontSide;
  late bool _flipXAxis;
  bool _userClick = false;
  bool _allowAction = true;
  bool initial = true;

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
    if (!_showFrontSide) {
      BlocProvider.of<GameBloc>(context)
          .add(GameEvent.onTapCard(widget.position, widget.frontAsset));
      if (_allowAction) {
        setState(() {
          _showFrontSide = true;
        });
      }
    }
  }

  void _closeCard() {
    _showFrontSide = false;
  }

  Widget _buildFlipAnimation() {
    return BlocConsumer<GameBloc, GameState>(
        listener: (context, state) {},
        builder: (context, state) {
          _allowAction = state.allowUserAction;
          if (state.wrong && state.showFrontSide[widget.position]) {
            _closeCard();
          }
          if(initial) {
            if(state.initLoading) {
              _showFrontSide = true;
            } else {
              _showFrontSide = false;
              initial = false;
            }
          }

          return GestureDetector(
            onTap: _onTapCard,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
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

  Widget __transitionBuilder(Widget mWidget, Animation<double> animation) {
    animation.addStatusListener((status) {
      if (_userClick) {
        BlocProvider.of<GameBloc>(context)
            .add(GameEvent.onAnimationStatus(widget.position, status));
      }
    });
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: mWidget,
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
      child: Image.asset(widget.frontAsset,
          frameBuilder: (mContext, child, frame, wasAsync) {
        if (frame != null) {
          BlocProvider.of<GameBloc>(context)
              .add(GameEvent.onGameStart(widget.position));
        }
        return child;
      }),
    );
  }

  Widget _buildRear() {
    return Container(
      key: const ValueKey(false),
      child: Image.asset(widget.rearAsset,
          frameBuilder: (mContext, child, frame, wasAsync) {
        if (frame == null) {
          return const CircularProgressIndicator();
        }
        return child;
      }),
    );
  }
}
