import 'package:shared_preferences/shared_preferences.dart';

class CacheFunc {
  static const keyExample = 'isAkk';

  static Future<void> saveBooleanValue(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyExample, value);
  }

  static Future<void> removeBooleanValue() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyExample);
  }
}
