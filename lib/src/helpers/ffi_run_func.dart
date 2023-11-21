import 'dart:ffi';

typedef LongLongFunc = LongLong Function();
typedef DartIntFunc = int Function();

int ffiRunIntFunc(lib, fnName) {
  final fn = lib.lookupFunction<LongLongFunc, DartIntFunc>(fnName);
  return fn();
}
