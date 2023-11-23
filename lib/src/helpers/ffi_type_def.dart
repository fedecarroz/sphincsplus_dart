import 'dart:ffi';

typedef LongLongFunc = UnsignedLongLong Function();
typedef DartIntFunc = int Function();

int ffiSimpleIntFunc(DynamicLibrary lib, String fnName) {
  final fn = lib.lookupFunction<LongLongFunc, DartIntFunc>(fnName);
  return fn();
}

typedef GenKeyPairSeedFunc = Int32 Function(
  Pointer<Uint8> pk,
  Pointer<Uint8> sk,
  Pointer<Uint8> seed,
);

typedef GenKeyPairSeed = int Function(
  Pointer<Uint8> pk,
  Pointer<Uint8> sk,
  Pointer<Uint8> seed,
);

typedef GenKeyPairFunc = Int32 Function(
  Pointer<Uint8> pk,
  Pointer<Uint8> sk,
);

typedef GenKeyPair = int Function(
  Pointer<Uint8> pk,
  Pointer<Uint8> sk,
);
