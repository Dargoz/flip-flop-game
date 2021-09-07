import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_state.freezed.dart';

@freezed
class GithubState with _$GithubState {
  const factory GithubState.initial() = Initial;
  const factory GithubState.actionInProgress() = ActionInProgress;
  const factory GithubState.success() = Success;
}