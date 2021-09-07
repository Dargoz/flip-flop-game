import 'package:flutter_clean_architecture_template/data/github/constants.dart';
import 'package:flutter_clean_architecture_template/data/github/remote/reponses/issue_response.dart';
import 'package:flutter_clean_architecture_template/domain/github/entities/issue.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'github_rest_api_client.g.dart';

@RestApi(baseUrl: 'https://api.github.com/')
abstract class GithubRestApiClient {

  factory GithubRestApiClient(Dio dio, {String baseUrl}) = _GithubRestApiClient;

  @POST('repos/$githubUser/$githubRepository/issues')
  Future<IssueResponse> createAndIssue(@Body() Issue issue);

}