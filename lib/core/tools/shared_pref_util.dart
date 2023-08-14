import 'package:nb_utils/nb_utils.dart';

const String _tokenKey = 'token';
const String _nameKey = 'name';
const String _roleKey = 'role';
const String _nimKey = 'nim';

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

  static void storeNim(String nim) async {
    sharedPreferences.setString(_nimKey, nim);
  }

  static String getNim() {
    return sharedPreferences.getString(_nimKey) ?? "";
  }

  static void storeRole(String role) async {
    sharedPreferences.setString(_roleKey, role);
  }

  static String getRole() {
    return sharedPreferences.getString(_roleKey) ?? "";
  }
}