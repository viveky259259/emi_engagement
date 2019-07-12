import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:emi_engagement/user_profile/user_model.dart';
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {



//  UserModel u1 = UserModel();

  Widget customText(String s, String St) => Container(

        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 0.0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 Text( s,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                 Text(
                    St,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600 ,
                    ),
                  ),
                const SizedBox(height: 10),
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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProfileAvatar(
                    'https://cdn4.vectorstock.com/i/1000x1000/14/73/robot-doctor-character-android-with-syringe-in-vector-19361473.jpg',
                    radius: 120,
                    backgroundColor: Colors.green,
                    borderWidth: 10,
                    initialsText: Text(
                      "AD",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    borderColor: Colors.green,
                    elevation: 5.0,
                    onTap: () {
                      print('adil');
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    customText("NAME","Vivek Yadav"),
                    customText("LOAN TAKEN","2"),
                    customText("LOAN TYPE","HOME LOAN"),
                    customText("CITY","MUMBAI"),
                    customText("STATE","MAHARASHTRA"),
                    customText("PAN NO","ABCD1234F"),
                    customText("AADHAR NO","548550008000"),
                    customText("DOB","12/08/1997"),
                    
                    

                  ],
                ),
              ),

            ],
          ),

      ),
    );
  }
}
