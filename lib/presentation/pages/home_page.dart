import 'package:flutter_clean_architecture_template/injection.dart';
import 'package:flutter_clean_architecture_template/presentation/pages/feedback_widget.dart';
import 'package:flutter_clean_architecture_template/usecase/feedback/feedback_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FeedbackBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Feeback'),
        ),
        body: FeedbackWidget(),
      )
    );
  }
}
