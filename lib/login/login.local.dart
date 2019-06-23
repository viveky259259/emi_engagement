import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreference {
  static const String _LOGGED_IN_USER_EMAIL_KEY = "logged_in_user_email";
  static const String _LOGGED_IN_USER_NAME_KEY = "logged_in_user_name";
  static const String _LOGGED_IN_USER_MOBILE_KEY = "logged_in_user_mobile";

  static void updateLoggedInUserEmail(String email) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setString(_LOGGED_IN_USER_EMAIL_KEY, email.toLowerCase());
    return;
  }

  static getLoggedInUserEmail() async {
    Completer completer = Completer();
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String email = prefs.getString(_LOGGED_IN_USER_EMAIL_KEY);
    completer.complete(email);
    return completer.future;
  }

  static void updateUserInformation(String name, mobile) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setString(_LOGGED_IN_USER_NAME_KEY, name);
    prefs.setString(_LOGGED_IN_USER_MOBILE_KEY, mobile);
    return;
  }
}
