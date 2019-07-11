import 'package:emi_engagement/faqPage/FAQListPage.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Frequently Asked Questions'),
          leading: InkWell(
            child: Icon(Icons.arrow_back_ios),
            onTap: () {},
          ),
        ),
        body: FAQList(),
      ),
    );
  }
}
