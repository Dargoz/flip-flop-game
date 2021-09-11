
import 'package:flutter/material.dart';

class ResponseErrorWidget extends StatelessWidget {
  const ResponseErrorWidget({this.userAction, this.errorMessage});

  final dynamic userAction;

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage!),
          ElevatedButton(
              onPressed: () {
                userAction(errorMessage);
              }, child: const Text("Back"))
        ],
      ),
    );
  }





}