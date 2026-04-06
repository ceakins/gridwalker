import 'package:encrypt/encrypt.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

/// A utility class for handling forensic data encryption and decryption.
/// 
/// It uses SHA-256 to derive a 32-byte AES key from a passphrase, ensuring
/// robust security for search-related data.
class EncryptionHelper {
  /// Generates a 32-byte AES [Key] from a [passphrase] using SHA-256.
  static Key _deriveKey(String passphrase) {
    final bytes = utf8.encode(passphrase);
    final digest = sha256.convert(bytes);
    return Key(Uint8List.fromList(digest.bytes));
  }

  /// Encrypts a [plainText] string using AES.
  /// 
  /// Uses the provided [passphrase] or a default secret key.
  /// Returns the encrypted string in Base64 format.
  static String encrypt(String plainText, {String? passphrase}) {
    final key = _deriveKey(passphrase ?? 'default_gridwalker_secret_key_32');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  /// Decrypts a [encryptedText] string using AES.
  /// 
  /// Uses the provided [passphrase] or a default secret key.
  /// Returns the original plain text, or "DECRYPTION_FAILED" on error.
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
