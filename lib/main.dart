import 'package:emi_engagement/chat_bot/chat.bot.ui.dart';
import 'package:emi_engagement/dashboard/dashboard.ui.dart';
import 'package:emi_engagement/login/login.dart';
import 'package:emi_engagement/onboarding/onboard.dart';
import 'package:emi_engagement/splash/splash.ui.dart';
import 'package:emi_engagement/user_profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:emi_engagement/payment/payment_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,),
     // home: Payhome(),
      home: SplashUi(),

      routes: {
        "/login": (context) => LoginUi(),
        "/dashboard": (context) => DashboardUi(),
        "/on_board": (context) => OnBoard(),
        "/Profile": (context) => ProfileScreen(),
        "/payment": (context) => Payhome(),
      },
    );
  }
}
