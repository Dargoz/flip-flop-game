import 'package:flutter_clean_architecture_template/domain/github/entities/issue.dart';
import 'package:flutter_clean_architecture_template/domain/github/i_github_repository.dart';
import 'package:flutter_clean_architecture_template/usecase/core/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'feedback_event.dart';

part 'feedback_state.dart';

part 'feedback_bloc.freezed.dart';

@injectable
class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc(this.repository) : super(FeedbackState());

  IGithubRepository repository;

  @override
  Stream<FeedbackState> mapEventToState(FeedbackEvent event) async* {
    yield* event.map(submit: (_) async* {
      print('on feedback submit event : $state');
      if (state.issue != null && state.issue!.title.isNotEmpty) {
        yield FeedbackState(status: Status.loading, showError: false);
        try {
          var response = await repository.createAndIssue(state.issue!);
          yield FeedbackState(
              issue: state.issue, status: Status.success, showError: false);
        } catch (e) {
          yield FeedbackState(
              issue: state.issue, status: Status.error, showError: false);
        }
      } else {
        yield FeedbackState(issue: state.issue, showError: true);
      }
    }, onTitleChanged: (FeedbackTitleChange value) async* {
      state.issue = Issue(title: value.titleStr, body: state.issue?.body);
    }, onDescriptionChanged: (FeedbackDescChange value) async* {
      state.issue = Issue(title: state.issue!.title, body: value.descStr);
    });
  }
}
