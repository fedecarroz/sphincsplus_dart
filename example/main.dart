import 'dart:typed_data';

import 'package:sphincsplus/sphincsplus_dart.dart';

void main() {
  final SpxSigner spxSigner = SpxSigner(params: Params.haraka_128f);

  print('PK len: ${spxSigner.pkLength}');
  print('SK len: ${spxSigner.skLength}');
  print('Seed len: ${spxSigner.seedLength}');
  print('Signature len: ${spxSigner.signatureLength}');

  final String seed = 'Z6ZD2dYrgrAAhkT0K0LqRR72WFDqTDAwXprtkypmgZ6WdMVU';
  final Uint8List publicKey, secretKey;
  (publicKey, secretKey) = spxSigner.generateKeyPair(seed: seed);
  print('Public key: $publicKey');
  print('Secret key: $secretKey');

  final String message = 'SPHINCS+ for dart';
  final Uint8List signedMessage = spxSigner.sign(
    message: message,
    secretKey: secretKey,
  );
  print('Signed message: $signedMessage');

  final bool result = spxSigner.verify(
    message: message,
    signedMessage: signedMessage,
    publicKey: publicKey,
  );
  result
      ? print('The signature is valid.')
      : print('The signature is not valid!');
}
