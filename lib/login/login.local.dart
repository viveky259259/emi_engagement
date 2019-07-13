import 'dart:async';

import 'package:emi_engagement/user_profile/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreference {
  static const String _LOGGED_IN_USER_EMAIL_KEY = "logged_in_user_email";
  static const String _LOGGED_IN_USER_NAME_KEY = "logged_in_user_name";
  static const String _LOGGED_IN_USER_MOBILE_KEY = "logged_in_user_mobile";
  static const String _LOGGED_IN_USER_UID_KEY = "logged_in_user_uid";
  static const String _LOGGED_IN_USER_STATE = "logged_in_user_state";
  static const String _LOGGED_IN_USER_CITY = "logged_in_user_city";
  static const String _LOGGED_IN_USER_AADHAR_NUM = "logged_in_user_aadhar_num";
  static const String _LOGGED_IN_USER_PAN_CARD = "logged_in_user_pan_card";

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
      String name,
      String mobile,
      String email,
      String uid,
      String state,
      String city,
      String panCard,
      int aadharNum) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setString(_LOGGED_IN_USER_NAME_KEY, name);
    prefs.setString(_LOGGED_IN_USER_MOBILE_KEY, mobile);
    prefs.setString(_LOGGED_IN_USER_EMAIL_KEY, email);
    prefs.setString(_LOGGED_IN_USER_UID_KEY, uid);
    prefs.setString(_LOGGED_IN_USER_STATE, state);
    prefs.setString(_LOGGED_IN_USER_CITY, city);
    prefs.setInt(_LOGGED_IN_USER_AADHAR_NUM, aadharNum);
    prefs.setString(_LOGGED_IN_USER_PAN_CARD, panCard);

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
    String city = prefs.getString(_LOGGED_IN_USER_CITY);
    String state = prefs.getString(_LOGGED_IN_USER_STATE);
    String panCard = prefs.getString(_LOGGED_IN_USER_PAN_CARD);
    int aadharNum = prefs.getInt(_LOGGED_IN_USER_AADHAR_NUM);

    UserModel userModel = UserModel(
        uid, name, email, mobile, city, state, panCard, aadharNum,
        dob: DateTime(1996, 7, 13));
    completer.complete(userModel);
    return completer.future;
  }

  static removeLoggedInUser() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.remove(_LOGGED_IN_USER_EMAIL_KEY);
    prefs.remove(_LOGGED_IN_USER_MOBILE_KEY);
    prefs.remove(_LOGGED_IN_USER_NAME_KEY);
    prefs.remove(_LOGGED_IN_USER_UID_KEY);
    prefs.remove(_LOGGED_IN_USER_CITY);
    prefs.remove(_LOGGED_IN_USER_STATE);
    prefs.remove(_LOGGED_IN_USER_PAN_CARD);
    prefs.remove(_LOGGED_IN_USER_AADHAR_NUM);
    return;
  }
}
