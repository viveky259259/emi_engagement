import 'dart:async';

import 'package:emi_engagement/login/login.local.dart';
import 'package:emi_engagement/onboarding/onboard.local.dart';
import 'package:flutter/material.dart';

class SplashUi extends StatefulWidget {
  @override
  _SplashUiState createState() => _SplashUiState();
}

class _SplashUiState extends State<SplashUi>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool isUserLoggedIn = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();

    UserSharedPreference.getLoggedInUserEmail().then((email) {
      if (email != null && email != "") {
        isUserLoggedIn = true;
      }
      startTimer();
    });
  }

  startTimer() async {
    var _duration = new Duration(seconds: 1, milliseconds: 500);
    return new Timer(_duration, startMainScreen);
  }

  startMainScreen() {
    AppOnBoardSharedPref.getIsOnBoardShown().then((isShown) {
      print(isShown);
      if (!isShown)
        Navigator.pushReplacementNamed(context, "/on_board");
      else {
        if (!isUserLoggedIn) {
          Navigator.pushReplacementNamed(context, "/login");
        } else {
          Navigator.pushReplacementNamed(context, "/dashboard");
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("ABC"),
      ),
    );
  }
}
