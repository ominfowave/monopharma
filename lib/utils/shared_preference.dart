
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/login/login_response.dart';

class SharedPref {

  final String KEY_ALREADY_LOGIN = "KEY_ALREADY_LOGIN"; // store already login or not
  final String KEY_TOKEN = "KEY_TOKEN"; // store which theme is selected
  final String KEY_LOGIN = "KEY_LOGIN"; // store user login info

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
  void setUserInfo(LoginResponse loginResponse)async{
    final SharedPreferences prefs = await _prefs;
    prefs.setString(KEY_LOGIN, jsonEncode(loginResponse));
  }

  Future<LoginResponse?> getUserInfo() async{
    final SharedPreferences prefs = await _prefs;
    LoginResponse? loginResponse;
    loginResponse = LoginResponse.fromJson(jsonDecode(prefs.getString(KEY_LOGIN)!));
    return loginResponse;
  }

  void setAlreadyLogin(bool isLogin) async{
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(KEY_ALREADY_LOGIN, isLogin);
  }

  Future<bool?> getAlreadyLogin() async{
    final SharedPreferences prefs = await _prefs;
    bool? isLogin;
    isLogin = prefs.getBool(KEY_ALREADY_LOGIN);
    return isLogin;
  }
}