import 'package:flutter/material.dart';

class Payhome extends StatefulWidget {
  @override
  _PayhomeState createState() => _PayhomeState();
}

class _PayhomeState extends State<Payhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () => {},
                color: Colors.deepPurpleAccent[200],
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[Icon(Icons.payment), Text("Pay")],
                ),
              ),
             SizedBox(width: 40),
              FlatButton(

                onPressed: () => {},
                color: Colors.deepPurpleAccent[200],
                padding: EdgeInsets.all(10.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[Icon(Icons.home
                  ), Text("Pick RQST")],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            "Payment",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
