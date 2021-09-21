
import 'package:flip_flop_game/domain/github/entities/issue.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('issue response test', () {
      var issue = Issue(title: 'asd');
      print('issue : ${issue.toJson()}');
  });

}