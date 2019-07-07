import 'dart:async';

import 'package:emi_engagement/user_profile/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreference {
  static const String _LOGGED_IN_USER_EMAIL_KEY = "logged_in_user_email";
  static const String _LOGGED_IN_USER_NAME_KEY = "logged_in_user_name";
  static const String _LOGGED_IN_USER_MOBILE_KEY = "logged_in_user_mobile";
  static const String _LOGGED_IN_USER_UID_KEY = "logged_in_user_uid";

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

  static void updateUserInformation(
      String name, String mobile, String email, String uid) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setString(_LOGGED_IN_USER_NAME_KEY, name);
    prefs.setString(_LOGGED_IN_USER_MOBILE_KEY, mobile);
    prefs.setString(_LOGGED_IN_USER_EMAIL_KEY, email);
    prefs.setString(_LOGGED_IN_USER_UID_KEY, uid);
    return;
  }

  static getLoggedInUser() async {
    Completer completer = Completer();
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String email = prefs.getString(_LOGGED_IN_USER_EMAIL_KEY);
    String mobile = prefs.getString(_LOGGED_IN_USER_MOBILE_KEY);
    String name = prefs.getString(_LOGGED_IN_USER_NAME_KEY);
    String uid = prefs.getString(_LOGGED_IN_USER_UID_KEY);
    UserModel userModel = UserModel(uid, name, email, mobile);
    completer.complete(userModel);
    return completer.future;
  }
}
