import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_money/shared/storage/app_key.dart';

class AppSecureStorage {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static Future<void> addItem(AppKey key, String value) async {
    await storage.write(key: key.toString(), value: value);
  }

  static Future<void> deleteItem(AppKey key) async {
    await storage.delete(key: key.toString());
  }

  static Future<String?> readItem(AppKey key) async {
    return await storage.read(key: key.toString());
  }
}
