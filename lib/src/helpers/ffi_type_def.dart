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

typedef SignFunc = Int32 Function(
  Pointer<Uint8> sm,
  Pointer<Uint64> smlen,
  Pointer<Uint8> m,
  Uint64 mlen,
  Pointer<Uint8> sk,
);

typedef Sign = int Function(
  Pointer<Uint8> sm,
  Pointer<Uint64> smlen,
  Pointer<Uint8> m,
  int mlen,
  Pointer<Uint8> sk,
);

typedef VerifySignatureFunc = Int32 Function(
  Pointer<Uint8> m,
  Pointer<Uint64> mlen,
  Pointer<Uint8> sm,
  Uint64 smlen,
  Pointer<Uint8> pk,
);

typedef VerifySignature = int Function(
  Pointer<Uint8> m,
  Pointer<Uint64> mlen,
  Pointer<Uint8> sm,
  int smlen,
  Pointer<Uint8> pk,
);
