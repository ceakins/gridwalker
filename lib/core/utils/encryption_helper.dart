import 'package:encrypt/encrypt.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

class EncryptionHelper {
  // Generate a 32-byte key from a passphrase using SHA-256
  static Key _deriveKey(String passphrase) {
    final bytes = utf8.encode(passphrase);
    final digest = sha256.convert(bytes);
    return Key(Uint8List.fromList(digest.bytes));
  }

  static String encrypt(String plainText, {String? passphrase}) {
    final key = _deriveKey(passphrase ?? 'default_gridwalker_secret_key_32');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  static String decrypt(String encryptedText, {String? passphrase}) {
    final key = _deriveKey(passphrase ?? 'default_gridwalker_secret_key_32');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    try {
      final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
      return decrypted;
    } catch (e) {
      return "DECRYPTION_FAILED";
    }
  }
}
