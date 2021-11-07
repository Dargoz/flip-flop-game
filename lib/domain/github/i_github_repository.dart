
import 'package:flip_flop_game/domain/github/entities/issue.dart';

abstract class IGithubRepository {

  Future createAndIssue(Issue issue);

}