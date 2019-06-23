import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class AppOnBoardSharedPref {
  static const String _IS_ONBOARD_SHOWN = "is_desc_shown";

  static getIsOnBoardShown() async {
    Completer completer = Completer();
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    bool isShown = prefs.getBool(_IS_ONBOARD_SHOWN);

    completer.complete((isShown == null) ? false : isShown);
    return completer.future;
  }

  static setIsOnBoardShown(bool isShown) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(_IS_ONBOARD_SHOWN, isShown);
    return;
  }
}
