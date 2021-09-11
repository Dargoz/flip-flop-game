part of 'feedback_bloc.dart';

class FeedbackState {
  FeedbackState(
      {this.issue,
        this.status = Status.initial,
      this.showError = false,
      this.isFormValid = false});

  Issue? issue = Issue(title: '');
  Status status;
  bool showError;
  bool isFormValid;

  @override
  String toString() {
    return 'FeedbackState{issue: $issue, status: $status, showError: $showError, isFormValid: $isFormValid}';
  }
}
