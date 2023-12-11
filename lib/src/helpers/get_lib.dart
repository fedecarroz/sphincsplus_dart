import 'dart:ffi';
import 'dart:io' show Directory;

import 'package:path/path.dart' as path;
import 'package:sphincsplus/sphincsplus.dart';

DynamicLibrary getLib(Params params) {
  final libraryPath = path.join(
    Directory.current.path,
    'lib',
    'src',
    'c_lib',
    '${params.name}.so',
  );

  return DynamicLibrary.open(libraryPath);
}
