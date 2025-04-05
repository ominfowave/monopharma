
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  final String KEY_ALREADY_LOGIN = "KEY_ALREADY_LOGIN"; // store already login or not
  final String KEY_TOKEN = "KEY_TOKEN"; // store which theme is selected


  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void setRole(bool isAdmin) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(KEY_ALREADY_LOGIN, isAdmin);
  }

  Future<bool?> getRole() async {
    final SharedPreferences prefs = await _prefs;
    bool? isAdmin;
    isAdmin = prefs.getBool(KEY_ALREADY_LOGIN);
    return isAdmin;
  }
  void setToken(String token)async{
    final SharedPreferences prefs = await _prefs;
    prefs.setString(KEY_TOKEN, token);
  }

  Future<String?> getToken() async{
    final SharedPreferences prefs = await _prefs;
    String? token;
    token = prefs.getString(KEY_TOKEN);
    return token;
  }

}