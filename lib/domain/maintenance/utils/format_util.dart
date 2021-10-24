

import 'package:flip_flop_game/domain/maintenance/entities/remaining.dart';
import 'package:intl/intl.dart';

class FormatUtil {

  static Remaining formatRemainingDuration(int estimateTs) {

    int now = DateTime.now().millisecondsSinceEpoch;
    Duration remaining = Duration(milliseconds: estimateTs - now);
    String dayLeft = _twoDigitFormat(remaining.inHours ~/ 24);
    String hoursLeft = _twoDigitFormat(remaining.inHours % 24);
    var dateTime = DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds);
    String minutesLeft = DateFormat("mm").format(dateTime);
    String secondsLeft = DateFormat("ss").format(dateTime);
    return Remaining(
      daysLeft: dayLeft,
      hoursLeft: hoursLeft,
      minutesLeft: minutesLeft,
      secondsLeft: secondsLeft
    );
  }

  static String _twoDigitFormat(int number) {
    if(number < 10) {
      return '0$number';
    } else {
      return '$number';
    }
  }


}