import 'dart:ffi';

import 'package:sphincsplus/sphincsplus_dart.dart';
import 'package:sphincsplus/src/helpers/ffi_run_func.dart';

class SpxSigner {
  /// Signer parameters
  final Params params;

  /// Dynamic library
  final DynamicLibrary _lib;

  /// SPHINCS+ Signer
  SpxSigner({required this.params}) : _lib = getLib(params);

  /// Returns the length of a [SecretKey]
  int get skLength => ffiRunIntFunc(_lib, 'crypto_sign_secretkeybytes');

  /// Returns the length of a [PublicKey]
  int get pkLength => ffiRunIntFunc(_lib, 'crypto_sign_publickeybytes');

  /// Returns the length of a [Signature]
  int get signatureLength => ffiRunIntFunc(_lib, 'crypto_sign_bytes');

  /// Returns the length of the seed required to generate a key pair
  int get seedLength => ffiRunIntFunc(_lib, 'crypto_sign_seedbytes');

  /// Generates a SPHINCS+ key pair ([PublicKey], [SecretKey]) given a seed
  /// Format sk: [SK_SEED || SK_PRF || PUB_SEED || root]
  /// Format pk: [root || PUB_SEED]
  (PublicKey, SecretKey) generateKeyPair({int? seed}) {
    // TODO: implement
    return (PublicKey(), SecretKey());
  }

  /// Returns a tuple ([Signature], [String]) followed by the message
  (Signature, String) sign(String message, SecretKey secretKey) {
    // TODO: implement
    return (Signature(), '');
  }

  /// Verifies a given signature-message pair under a given [PublicKey]
  bool verify(
    String message,
    Signature signature,
    PublicKey publicKey,
  ) {
    // TODO: implement
    return true;
  }
}
