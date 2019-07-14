import 'package:flutter/material.dart';

var pageList = [
  PageModel(
      imageUrl: "assets/image_01.png",
      title: "WELCOME",
      body: "TO ADITYA BIRLA LOAN APP",
      titleGradient: gradients[0]),
  PageModel(
      imageUrl: "assets/illustration2.png",
      title: "ACCOUNT OVERVIEW",
      body: "REVIEW LOAN STATUS,PENDING BALANCE AND MORE.",
      titleGradient: gradients[1]),
  PageModel(
      imageUrl: "assets/illustration3.png",
      title: "LOAN HISTORY",
      body: "PREVIEW LOAN HISTORY WITH ONE CLICK.",
      titleGradient: gradients[2]),
];

List<List<Color>> gradients = [
  [Color(0xFF9708CC), Color(0xFF43CBFF)],
  [Color(0xFFE2859F), Color(0xFFFCCF31)],
  [Color(0xFF5EFCE8), Color(0xFF736EFE)],
];

class PageModel {
  var imageUrl;
  var title;
  var body;
  List<Color> titleGradient = [];
  PageModel({this.imageUrl, this.title, this.body, this.titleGradient});
}
