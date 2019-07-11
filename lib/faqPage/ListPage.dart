import 'package:emi_engagement/constants/colors.constants.dart';
import 'package:emi_engagement/faqPage/FAQListPage.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: AppBar(
          backgroundColor:ColorConstants.faqAppBarBackground,
          title: Text('Frequently Asked Questions'),
        ),
        body: FAQList(),
      );
  }
}
