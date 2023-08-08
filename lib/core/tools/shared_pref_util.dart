import 'package:nb_utils/nb_utils.dart';

const String _tokenKey = 'token';
const String _nameKey = 'name';
const String _roleKey = 'role';

class SharedPrefUtil {

  static void storeToken(String token) async {
    sharedPreferences.setString(_tokenKey, token);
  }

  static String getToken() {
    return sharedPreferences.getString(_tokenKey) ?? "";
  }

  static void storeName(String name) async {
    sharedPreferences.setString(_nameKey, name);
  }

  static String getName() {
    return sharedPreferences.getString(_nameKey) ?? "";
  }

  static void storeRole(String role) async {
    sharedPreferences.setString(_roleKey, role);
  }

  static String getRole() {
    return sharedPreferences.getString(_roleKey) ?? "";
  }

}