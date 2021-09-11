import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_clean_architecture_template/presentation/widgets/loading_widget.dart';
import 'package:flutter_clean_architecture_template/presentation/widgets/response_error_widget.dart';
import 'package:flutter_clean_architecture_template/presentation/widgets/success_widget.dart';
import 'package:flutter_clean_architecture_template/usecase/core/status.dart';
import 'package:flutter_clean_architecture_template/usecase/feedback/feedback_bloc.dart';

class FeedbackWidget extends StatelessWidget {
  late final AppLocalizations localizations;

  FeedbackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context)!;
    return BlocConsumer<FeedbackBloc, FeedbackState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
              return _buildFeedbackForm(context, state);
            case Status.loading:
              return LoadingWidget();
            case Status.success:
              return SuccessWidget();
            case Status.error:
              return ResponseErrorWidget(
                  userAction: _onErrorHandling,
                  errorMessage: localizations.errorFeedback);
          }
        });
  }

  void _onErrorHandling(String errorMessage) {}

  Widget _buildFeedbackForm(BuildContext context, FeedbackState state) {
    final feedbackBloc = BlocProvider.of<FeedbackBloc>(context);
    return Center(
      child: SizedBox(
        width: 500,
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 8),
                child: TextFormField(
                  autovalidateMode: state.showError
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  onChanged: (e) =>
                      feedbackBloc.add(FeedbackEvent.onTitleChanged(e)),
                  validator: (e) {
                    if (state.showError) {
                      return 'title cannot be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: localizations.title,
                      border: const OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
                child: TextFormField(
                  onChanged: (e) =>
                      feedbackBloc.add(FeedbackEvent.onDescriptionChanged(e)),
                  decoration: InputDecoration(
                    labelText: localizations.description,
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => feedbackBloc.add(FeedbackEvent.submit()),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(500, 64),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5))),
                ),
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
