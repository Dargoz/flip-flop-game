import 'package:flutter_clean_architecture_template/data/github/remote/reponses/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'issue_response.g.dart';

@JsonSerializable()
class IssueResponse {
  IssueResponse(
      {required this.id,
      required this.nodeId,
      required this.url,
      required this.repositoryUrl,
      required this.labelsUrl,
      required this.commentsUrl,
      required this.eventsUrl,
      required this.htmlUrl,
      required this.number,
      required this.state,
      required this.title,
      required this.body,
      required this.user});

  int id;
  String nodeId;
  String url;
  String repositoryUrl;
  String labelsUrl;
  String commentsUrl;
  String eventsUrl;
  String htmlUrl;
  int number;
  String state;
  String title;
  String? body;
  UserResponse user;

  factory IssueResponse.fromJson(Map<String, dynamic> json) =>
      _$IssueResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IssueResponseToJson(this);

  @override
  String toString() {
    return 'IssueResponse{id: $id, nodeId: $nodeId, url: $url, repositoryUrl: $repositoryUrl, labelsUrl: $labelsUrl, commentsUrl: $commentsUrl, eventsUrl: $eventsUrl, htmlUrl: $htmlUrl, number: $number, state: $state, title: $title, body: $body, user: $user}';
  }
}
