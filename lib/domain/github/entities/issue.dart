import 'package:json_annotation/json_annotation.dart';

part 'issue.g.dart';

@JsonSerializable()
class Issue {
  Issue(
      {required this.title,
      this.body,
      this.milestone,
      this.labels,
      this.assignee,
      this.assignees = const []});

  String title;
  String? body;
  String? assignee;
  String? milestone;
  String? labels;
  List<String> assignees;

  factory Issue.fromJson(Map<String, dynamic> json) => _$IssueFromJson(json);

  Map<String, dynamic> toJson() => _$IssueToJson(this);

  @override
  String toString() {
    return 'Issue{title: $title, body: $body, assignee: $assignee, milestone: $milestone, labels: $labels, assignees: $assignees}';
  }
}
