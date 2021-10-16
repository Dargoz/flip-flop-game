import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LeaderboardState();
}

class LeaderboardState extends State<LeaderboardPage> {
  int _refresh = 0;

  @override
  void initState() {
    super.initState();
    _activateListener();
  }

  void _activateListener() {
    var database =
        FirebaseDatabase.instance.reference().child('/leaderboard/refresh');
    database.onValue.listen((event) {
      print('event : ${event.snapshot.value}');
      setState(() {
        _refresh = (event.snapshot.value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text("Leaderboard"),
      const Spacer(),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8,
        constraints: const BoxConstraints(minWidth: 80, minHeight: 80),
        child:
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              for (int idx = 1; idx <= 8; idx++)
                Container(
                  width: 300,
                  height: 500,
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text("group $idx"),
                  ),
                )
            ],
          ),
        ),

      ),
    ]);
  }
}
