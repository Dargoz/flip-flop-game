
import 'package:flutter/cupertino.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message),);
  }



}