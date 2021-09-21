import 'package:flip_flop_game/data/github/constants.dart';
import 'package:flip_flop_game/data/github/remote/reponses/issue_response.dart';
import 'package:flip_flop_game/domain/github/entities/issue.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'github_rest_api_client.g.dart';

@RestApi(baseUrl: 'https://api.github.com/')
abstract class GithubRestApiClient {

  factory GithubRestApiClient(Dio dio, {String baseUrl}) = _GithubRestApiClient;

  @POST('repos/$githubUser/$githubRepository/issues')
  Future<IssueResponse> createAndIssue(@Body() Issue issue);

}