import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:sphincsplus/sphincsplus_dart.dart';

class SpxSigner {
  /// Signer parameters
  final Params params;

  /// Dynamic library
  final DynamicLibrary _lib;

  /// SPHINCS+ Signer
  SpxSigner({required this.params}) : _lib = getLib(params);

  /// Returns the length of a secret key
  int get skLength => ffiSimpleIntFunc(_lib, 'crypto_sign_secretkeybytes');

  /// Returns the length of a public key
  int get pkLength => ffiSimpleIntFunc(_lib, 'crypto_sign_publickeybytes');

  /// Returns the length of a signature
  int get signatureLength => ffiSimpleIntFunc(_lib, 'crypto_sign_bytes');

  /// Returns the length of the seed required to generate a key pair
  int get seedLength => ffiSimpleIntFunc(_lib, 'crypto_sign_seedbytes');

  /// Generates a SPHINCS+ key pair (public key, secret key)
  (Uint8List, Uint8List) generateKeyPair({int? seed}) {
    Pointer<Uint8> pkPointer = calloc.allocate(pkLength);
    Pointer<Uint8> skPointer = calloc.allocate(skLength);

    final Function fn;
    if (seed != null) {
      fn = _lib.lookupFunction<GenKeyPairSeedFunc, GenKeyPairSeed>(
        'crypto_sign_seed_keypair',
      );
      Pointer<Uint8> seedPointer = calloc.allocate(seedLength);
      seedPointer.value = seed;
      fn(pkPointer, skPointer, seedPointer);
      calloc.free(seedPointer);
    } else {
      fn = _lib.lookupFunction<GenKeyPairFunc, GenKeyPair>(
        'crypto_sign_keypair',
      );
      fn(pkPointer, skPointer);
    }

    final Uint8List pk = pkPointer.asTypedList(pkLength);
    final Uint8List sk = skPointer.asTypedList(skLength);

    calloc
      ..free(pkPointer)
      ..free(skPointer);

    return (pk, sk);
  }

  /// Returns a signature followed by the message
  (Uint8List, Uint8List) sign(Uint8List message, Uint8List secretKey) {
    // TODO: implement
    return (Uint8List(signatureLength), Uint8List(message.length));
  }

  /// Verifies a given signature-message pair under a given public key
  bool verify(
    Uint8List message,
    Uint8List signature,
    Uint8List publicKey,
  ) {
    // TODO: implement
    return true;
  }
}
