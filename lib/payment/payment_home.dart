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
              onPressed: () {

                _scaffoldKey.currentState.showSnackBar(new SnackBar(
                  duration: Duration(seconds: 10),
                    content: new Text("Redirecting...")));
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
                    content: new Text("Thanks for choosing pickup facility. Our executive will visit in 2 days")));
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
