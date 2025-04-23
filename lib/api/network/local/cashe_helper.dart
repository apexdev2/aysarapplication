import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static late FlutterSecureStorage _secureStorage;

  /// Initializes SharedPreferences
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    _secureStorage = const FlutterSecureStorage();
  }

  /// Clears a specific key from both SharedPreferences and SecureStorage
  static Future<void> clearCache({required String key}) async {
    await sharedPreferences.remove(key);
    await _secureStorage.delete(key: key);
  }

  /// Clears all cached data securely
  static Future<void> clearAll() async {
    await sharedPreferences.clear();
    await _secureStorage.deleteAll();
  }

  // ====================== SECURE DATA STORAGE (Encrypted) ======================

  /// Saves **encrypted** data (e.g., tokens, passwords)
  static Future<void> assignSecureData({
    required String key,
    required String value,
  }) async {
    await _secureStorage.write(key: key, value: value);
  }

  /// Retrieves **decrypted** secure data
  static Future<String?> getSecureData({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  // ====================== STANDARD STORAGE (For Non-Sensitive Data) ======================

  /// Saves **String** data
  static Future<bool> assignData({
    required String key,
    required String value,
  }) async {
    return await sharedPreferences.setString(key, value);
  }

  /// Saves **Integer** data
  static Future<bool> assignIntegerData({
    required String key,
    required int value,
  }) async {
    return await sharedPreferences.setInt(key, value);
  }

  /// Saves **Boolean** data
  static Future<bool> assignBoolData({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences.setBool(key, value);
  }

  /// Retrieves non-secure data (String, Int, Bool)
  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }
}
