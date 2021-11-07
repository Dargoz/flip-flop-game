

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Loading...", style: TextStyle(
            color: Color.fromARGB(200, 69, 69, 69),
            fontSize: 42,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold)),
      ),
    );
  }

}