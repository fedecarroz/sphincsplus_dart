import 'dart:typed_data';

import 'package:sphincsplus/sphincsplus_dart.dart';

void main() {
  final spxSigner = SpxSigner(params: Params.haraka_128f);

  print('PK len: ${spxSigner.pkLength}');
  print('SK len: ${spxSigner.skLength}');
  print('Seed len: ${spxSigner.seedLength}');
  print('Signature len: ${spxSigner.signatureLength}');

  Uint8List pk, sk;
  (pk, sk) = spxSigner.generateKeyPair(seed: 16);
  print('Public key: $pk');
  print('Secret key: $sk');
}
