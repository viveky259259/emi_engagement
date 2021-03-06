import 'package:flutter/material.dart';

class TextStyleConstants {
  static TextStyle primaryMessageCard =
      TextStyle(color: Colors.white, fontSize: 18);
  static TextStyle secondaryMessageCard = TextStyle(
    color: Colors.white,

  );

  static TextStyle primaryRecommendationCard =
      TextStyle(color: Colors.white, fontSize: 24);

  static TextStyle primaryRecommendationCardShadows =
  TextStyle(color: Colors.white, fontSize: 24,shadows: [
    Shadow(
      offset: Offset(1.0, 1.0),
      blurRadius: 1.0,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
//    Shadow(
//      offset: Offset(1.0, 1.0),
//      blurRadius: 1.0,
//      color: Color.fromARGB(125, 0, 0, 255),
//    ),
  ]);
  static TextStyle secondaryRecommendationCard =
      TextStyle(color: Colors.white, fontSize: 16,shadows: [
          Shadow(
          offset: Offset(1.0, 1.0),
      blurRadius: 1.0,
  color: Color.fromARGB(255, 0, 0, 0),
  ),]);
  static TextStyle secondaryRecommendationCardShadow =
  TextStyle(color: Colors.white, fontSize: 16,shadows: [
    Shadow(
      offset: Offset(1.0, 1.0),
      blurRadius: 1.0,
      color: Color.fromARGB(255, 0, 0, 0),
    ),]);
  static TextStyle secondaryRecommendationIntrestCard =
      TextStyle(color: Colors.white, fontSize: 16,shadows: [
        Shadow(
          offset: Offset(1.0, 1.0),
          blurRadius: 1.0,
          color: Color.fromARGB(255, 0, 0, 0),
        ),]);
  static TextStyle primaryText=TextStyle(
    color: Colors.black,fontSize: 16
  );
  static TextStyle primaryTextWhite=TextStyle(
      color: Colors.white,fontSize: 16
  );
  static TextStyle primaryTextWhiteBold=TextStyle(
      color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold
  );
  static TextStyle secondaryText=TextStyle(
      color: Colors.black54,fontSize: 14
  );
  static TextStyle secondaryTextWhite=TextStyle(
      color: Colors.white70,fontSize: 14
  );
  static TextStyle mediumText=TextStyle(
      color: Colors.black,fontSize: 20
  );
  static TextStyle mediumTextWhite=TextStyle(
      color: Colors.white,fontSize: 20
  );

  static TextStyle mediumTextWhiteBold=TextStyle(
      color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold
  );
  static TextStyle mediumBoldText=TextStyle(
      color: Colors.black,fontSize: 20,
    fontWeight: FontWeight.bold
  );
  static TextStyle mediumBoldTextWhite=TextStyle(
      color: Colors.white,fontSize: 20,
      fontWeight: FontWeight.bold
  );
  static TextStyle smallBoldText=TextStyle(
      color: Colors.black,fontSize: 14,
      fontWeight: FontWeight.bold
  );
  static TextStyle smallBoldTextWhite=TextStyle(
      color: Colors.white,fontSize: 14,
      fontWeight: FontWeight.bold,

  );
  static TextStyle birthday=TextStyle(
    color: Colors.red.shade800,fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle birthdayMedium=TextStyle(
    color: Colors.red.shade800,fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}

