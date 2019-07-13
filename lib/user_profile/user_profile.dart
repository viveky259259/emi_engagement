import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:emi_engagement/constants/textstyles.constants.dart';
import 'package:emi_engagement/loan/loan.server.dart';
import 'package:emi_engagement/loan/loan_model.dart';
import 'package:emi_engagement/login/login.local.dart';
import 'package:flutter/material.dart';
import 'package:emi_engagement/user_profile/user_model.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel userModel;
  bool isLoading = true;
  bool isLoansLoading = true;
  List<LoanModel> loans = List();

  @override
  initState() {
    UserSharedPreference.getLoggedInUser().then((user) {
      userModel = user;
      isLoading = false;
      setState(() {});
      LoanServer.getLoans(userModel.email).then((loans) {
        this.loans = loans;
        setState(() {
          isLoansLoading = false;
        });
      }).catchError((error) {});
    }).catchError((error) {});
  }

  Widget customText(String title, String value) => Container(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
//                    fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            flex: 1, child: customText("NAME", userModel.name)),
                        Expanded(
                          flex: 1,
                          child: CircularProfileAvatar(
                            'https://cdn4.vectorstock.com/i/1000x1000/14/73/robot-doctor-character-android-with-syringe-in-vector-19361473.jpg',
                            radius: 96,
//                            backgroundColor: Colors.green,
                            borderWidth: 10,
                            cacheImage: true,

                            initialsText: Text(
                              "AD",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white),
                            ),
//                            borderColor: Colors.green,
                            elevation: 5.0,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          customText(
                              "Loans",
                              (isLoansLoading)
                                  ? "Loading.."
                                  : loans.length.toString()),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Divider()),
                          customText("City", userModel.city),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Divider()),
                          customText("State", userModel.state),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Divider()),
                          customText("Birth Date ", "13th July,1996"),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Divider()),
                          customText("Pan No", userModel.panCard),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Divider()),
                          customText(
                              "Aadhar no", userModel.aadharNum.toString()),
                          Container(
                              margin: EdgeInsets.only(top: 24),
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 32),
                              child: FlatButton(
                                color: Colors.red.shade300,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                onPressed: () {
                                  UserSharedPreference.removeLoggedInUser();
                                  Navigator.of(context)
                                      .pushReplacementNamed("/login");
                                },
                                child: Container(
                                    padding: EdgeInsets.all(8),
                                    margin: EdgeInsets.all(8),
                                    child: Text(
                                      "Logout",
                                      style:
                                          TextStyleConstants.primaryTextWhite,
                                    )),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
