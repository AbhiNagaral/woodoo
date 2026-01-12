import 'package:shared_preferences/shared_preferences.dart';

class PrefKeys {
  static const accessToken = 'access_token';
  static const isLoggedIn = 'is_logged_in';
  static const locale = 'locale';
}

class AppPreferences {
  final SharedPreferences _prefs;

  AppPreferences(this._prefs);

  // =============== READ =================

  T? get<T>(String key) {
    final value = _prefs.get(key);

    if (value is T) return value;
    return null;
  }

  // =============== WRITE =================

  Future<bool> set<T>(String key, T value) {
    if (value is String) {
      return _prefs.setString(key, value);
    } else if (value is int) {
      return _prefs.setInt(key, value);
    } else if (value is bool) {
      return _prefs.setBool(key, value);
    } else if (value is double) {
      return _prefs.setDouble(key, value);
    } else if (value is List<String>) {
      return _prefs.setStringList(key, value);
    } else {
      throw UnsupportedError(
        'Type ${value.runtimeType} is not supported',
      );
    }
  }

  // =============== REMOVE =================

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  Future<bool> clear() {
    return _prefs.clear();
  }
}
