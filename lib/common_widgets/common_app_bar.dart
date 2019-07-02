import 'package:emi_engagement/constants/colors.constants.dart';
import 'package:flutter/material.dart';

class CommonAppBar {
 static getCommonAppBar(
    String title, {
    Color bgColor = ColorConstants.appBarColor,
    bool centerTitle = true,
  }) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      backgroundColor: bgColor,
    );
  }
}
