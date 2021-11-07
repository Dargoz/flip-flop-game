
import 'package:flutter/cupertino.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.score}) : super(key: key);

  final String score;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Your Score :$score\nSilakan tutup halaman ini"),
    );
  }

}