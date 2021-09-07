import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_event.freezed.dart';

@freezed
class GithubEvent with _$GithubEvent {
  const factory GithubEvent.addIssue(String issue) = _Added;
}