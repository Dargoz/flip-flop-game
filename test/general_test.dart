

import 'package:path/path.dart' as p;
import 'dart:convert';
import 'package:crypto/crypto.dart';

Future<void> main() async {

  print('Current path style: ${p.style}');

  print('Current process path: ${p.current}');
  var key = utf8.encode("aYzIx");
  var encoded = utf8.encode("3");
  var hmacSha256 = Hmac(sha256, key);
  var digest = hmacSha256.convert(encoded);
  print('utf8 encode : $digest');
  print('utf8 dencode : ${utf8.decode(encoded)}');

  for (var entry in [p.posix, p.windows, p.url]) {
    print('  ${entry.style.toString().padRight(7)}: ${entry.separator}');
  }


  print('end ========');
}