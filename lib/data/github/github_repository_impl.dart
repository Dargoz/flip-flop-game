import 'package:flip_flop_game/data/core/remote/rest_client_configuration.dart';
import 'package:flip_flop_game/data/github/remote/github_rest_api_client.dart';
import 'package:flip_flop_game/domain/github/entities/issue.dart';
import 'package:flip_flop_game/domain/github/i_github_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IGithubRepository)
class GithubRepositoryImpl extends IGithubRepository {
  final GithubRestApiClient client =
      GithubRestApiClient(RestClientConfiguration.dio);

  @override
  Future createAndIssue(Issue issue) async {
    print('create and issue $issue');
    final response = await client.createAndIssue(issue);
    print('response : $response');
    return response;
  }
}
