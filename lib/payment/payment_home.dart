import 'package:achievement_view/achievement_view.dart';
import 'package:emi_engagement/constants/textstyles.constants.dart';
import 'package:flutter/material.dart';

class Payhome extends StatefulWidget {
  @override
  _PayhomeState createState() => _PayhomeState();
}

class _PayhomeState extends State<Payhome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context1) {
    showAchievement(String title, String subtitle) {
      AchievementView(context1,
          title: "$title!",
          subTitle: subtitle,
          //onTab: _onTabAchievement,
          //icon: Icon(Icons.insert_emoticon, color: Colors.white,),
          //typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
          //borderRadius: 5.0,
          //color: Colors.blueGrey,
          //textStyleTitle: TextStyle(),
          //textStyleSubTitle: TextStyle(),
          //alignment: Alignment.topCenter,
          duration: Duration(seconds: 3),
          isCircle: false, listener: (status) {
        print(status);
        //AchievementState.opening
        //AchievementState.open
        //AchievementState.closing
        //AchievementState.closed
      })
        ..show();
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: Text(
          "Payment",
        ),
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Select one option to pay",
              style: TextStyleConstants.mediumBoldText,
            ),
            SizedBox(height: 16),
            FlatButton(
              onPressed: () async {
                bool isCompleted = await showDialog(
                    context: context1,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        title: Text("Online Payment"),
                        content: Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Redirecting to payment site",
                                style: TextStyleConstants.primaryText,
                              ),
                              Text(
                                "Please wait ...",
                                style: TextStyleConstants.mediumBoldText,
                              )
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Text("Complete"),
                            padding: EdgeInsets.all(8),
                          )
                        ],
                      );
                    });
                if (isCompleted) {
                  showAchievement("Congratulations",
                      "You have earned 500 points for paying installment");
                }
              },
              padding: EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(45)),
                    image: DecorationImage(
                        image: AssetImage("assets/pay_online.png"))),
              ),
            ),
            FlatButton(
              onPressed: () {
                _scaffoldKey.currentState.showSnackBar(new SnackBar(
                    duration: Duration(seconds: 10),
                    content: new Text(
                        "Thanks for choosing pickup facility. Our executive will visit in 2 days")));
              },
              padding: EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(45)),
                    image: DecorationImage(
                        image: AssetImage("assets/requestpickup.png"))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
