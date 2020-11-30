import 'package:encrypt/encrypt.dart';

class EncrytService {
  Future<String> getEncryptedText(String text, String key1) async {
    final plainText = text;
    final key = Key.fromUtf8(key1);
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    //print(
    //    "Encrypted text Decrypted : $decrypted"); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
    print("encrypted text : ${encrypted.base64}"); // R4PxiU3h8YoI
    return encrypted.base64;
  }

  Future<String> getDecryptedText(String text, String key1) async {
    final plainText = text;
    final key = Key.fromUtf8(key1);
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));

    Encrypted encrypted1 = Encrypted.from64(text);
    //final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted1, iv: iv);
    print(
        ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    print(
        "Encrypted text Decrypted : $decrypted"); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
    //print("encrypted text : ${encrypted.base64}"); // R4PxiU3h8YoI
    print(
        ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

    return decrypted;
  }
}
