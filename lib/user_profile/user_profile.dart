import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}





class _ProfileScreenState extends State<ProfileScreen> {


Widget customText() => Container(


    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('profile'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),

              child: CircularProfileAvatar(
                'https://avatars0.githubusercontent.com/u/8264639?s=460&v=4',
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

          ],
        ),
      ) ,

    );
  }
}
