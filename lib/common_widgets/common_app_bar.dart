import 'package:flutter/material.dart';

class CommonAppBar {
 static getCommonAppBar(
    String title, {
    Color bgColor = Colors.blue,
    bool centerTitle = true,
  }) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      backgroundColor: bgColor,
    );
  }
}
