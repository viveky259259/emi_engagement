import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget customText() => Container(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 0.0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                 Text(
                    'NAME',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                 Text(
                    'xyz pqr abc',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     // appBar: AppBar(
     //   title: Text('profile'),
      //),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProfileAvatar(
                  'https://www.kevinsimon.co.uk/wp-content/uploads/2014/11/wpid-wp-1416776451344.gif',
                  radius: 120,
                  backgroundColor: Colors.green,
                  borderWidth: 10,
                  initialsText: Text(
                    "AD",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  borderColor: Colors.white,
                  elevation: 5.0,
                  onTap: () {
                    print('adil');
                  },
                ),
              ),
              customText(),
              customText(),
              customText(),
              customText(),
              customText(),
              customText(),
              customText(),

            ],
          ),
        ),
      ),
    );
  }
}
