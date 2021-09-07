
import 'package:flutter_clean_architecture_template/domain/github/entities/issue.dart';

abstract class IGithubRepository {

  Future createAndIssue(Issue issue);

}