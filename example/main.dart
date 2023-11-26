import 'dart:typed_data';

import 'package:sphincsplus/sphincsplus_dart.dart';

void main() {
  final SpxSigner spxSigner = SpxSigner(params: Params.haraka_128f);

  print('PK len: ${spxSigner.pkLength}');
  print('SK len: ${spxSigner.skLength}');
  print('Seed len: ${spxSigner.seedLength}');
  print('Signature len: ${spxSigner.signatureLength}');

  final Uint8List publicKey, secretKey;
  (publicKey, secretKey) = spxSigner.generateKeyPair(seed: 16);
  print('Public key: $publicKey');
  print('Secret key: $secretKey');

  final String message = 'SPHINCS+ for dart';
  final Uint8List signedMessage = spxSigner.sign(message, secretKey);
  print('Signed message: ${signedMessage.length}');

  spxSigner.verify(message, signedMessage, publicKey)
      ? print('The signature is valid.')
      : print('The signature is not valid!');
}
