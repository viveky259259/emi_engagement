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
  // This widget is the root of your application.
  final Map<String, dynamic> user = {
    'name': 'Nguyen Duc Duy',
    'title': 'Software Engineer @ 6Mui',
    'intersections': [
      [12.976321, 77.591332],
      [12.966321, 77.591332],
      [12.965321, 77.592332],
      [12.985321, 77.592432],
      [12.976321, 77.581332],
      [12.966321, 77.571332],
      [12.965321, 77.598332],
      [12.985321, 77.593432]
    ],
    'image':
        'https://www.seducewithpersonality.com/wp-content/uploads/2013/08/Tests-from-women.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
