part of 'select_bloc.dart';

@freezed
class SelectEvent with _$SelectEvent {

  factory SelectEvent.onPlayerSelected(Player player) = PlayerSelected;


}