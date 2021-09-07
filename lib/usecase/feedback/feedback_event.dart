part of 'feedback_bloc.dart';

@freezed
class FeedbackEvent with _$FeedbackEvent {
  factory FeedbackEvent.submit() = FeedbackSubmit;
  factory FeedbackEvent.onTitleChanged(String titleStr) = FeedbackTitleChange;
  factory FeedbackEvent.onDescriptionChanged(String descStr) = FeedbackDescChange;
}