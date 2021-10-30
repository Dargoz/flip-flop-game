import 'package:flip_flop_game/domain/firebase/entities/player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'select_event.dart';

part 'select_state.dart';

part 'select_bloc.freezed.dart';

@injectable
class SelectBloc extends Bloc<SelectEvent, SelectState> {
  SelectBloc() : super(SelectState(Player("UND", '09', 0, 0)));

  @override
  Stream<SelectState> mapEventToState(SelectEvent event) async* {
    yield* event.map(onPlayerSelected: (onPlayerSelected) async* {
      yield SelectState(onPlayerSelected.player);
    });
  }
}
