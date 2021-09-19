
import 'dart:io';

import 'package:path/path.dart' as p;


Future<void> main() async {

  print('Current path style: ${p.style}');

  print('Current process path: ${p.current}');


  for (var entry in [p.posix, p.windows, p.url]) {
    print('  ${entry.style.toString().padRight(7)}: ${entry.separator}');
  }

  var dir = Directory.fromUri(Uri.file('resources/pack1', windows: true));
  await for (var entity in
  dir.list(recursive: false, followLinks: false)) {
    print(entity.path);
  }
  print('end ========');
}