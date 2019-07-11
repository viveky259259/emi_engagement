import 'package:emi_engagement/faqPage/HelpCard.dart';
import 'package:flutter/material.dart';

class FAQList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: helpCard.length,
      itemBuilder: (context, index) {
        final HelpCard helpcardh = helpCard[index];
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Padding(
            padding: EdgeInsets.all(9.0),
            child: ExpansionTile(

              title: Text(
                helpcardh.questionsName,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              children: <Widget>[
                ListTile(
                  title: Text(helpcardh.answerName),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
