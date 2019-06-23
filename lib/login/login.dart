import 'package:emi_engagement/utils/CheckConectivity.dart';
import 'package:flutter/material.dart';

class LoginUi extends StatefulWidget {
  @override
  _LoginUiState createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();

  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptTerms': false
  };
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  bool isOffline = true;
  bool _isSelected = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  void _checkConn() {
    setState(() {
      connectionStatus.checkConnection().then((hascon) {
        isOffline = !hascon;
        if (!isOffline) {
          _submitForm();
        } else {
          _scaffoldKey.currentState.showSnackBar(
              new SnackBar(content: new Text('No Internet connection')));
        }
      }); // Do something else...
    });
  }

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
      _formData['acceptTerms'] = _isSelected;
      print(_formData['acceptTerms']);
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 22.0,
        height: 22.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  void _submitForm() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    Map<String, dynamic> successInformation = {"success": true};
//    successInformation = await authenticate(
//        _formData['email'], _formData['password'], _authMode);
    if (successInformation['success']) {
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('An Error Occurred!'),
            content: Text(successInformation['message']),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Image.asset("assets/image_01.png"),
                ),
                Expanded(
                  child: Container(),
                ),
                Image.asset("assets/image_02.png")
              ],
            ),
            Positioned(
              top: 48,
//              left: 24,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
//                  Image.asset(
//                    "assets/logo.png",
//                    width: 110,
//                    height: 110,
//                  ),
                  Expanded(
                    child: Text("Aditya Birla Finance ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Poppins-Bold",
                            fontSize: 32,
//                            color: Colors.,
//                            letterSpacing: .6,

                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 28.0,
                  right: 28.0,
                  top: MediaQuery.of(context).size.height / 3),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: double.infinity,
                      height: 360,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 15.0),
                                blurRadius: 15.0),
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, -10.0),
                                blurRadius: 10.0),
                          ]),
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Login',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontFamily: "Poppins-Bold",
                                    letterSpacing: .6)),
                            SizedBox(
                              height: 16,
                            ),
                            Text("Email",
                                style: TextStyle(
                                    fontFamily: "Poppins-Medium",
                                    fontSize: 16)),
                            TextFormField(
                              focusNode: _emailFocusNode,
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12.0)),
                              controller: _emailTextController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              validator: (String value) {
                                if (value.isEmpty ||
                                    !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                        .hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                              },
                              onSaved: (String value) {
                                _formData['email'] = value;
                              },
                              onFieldSubmitted: (v) {
                                print("submit");
                                FocusScope.of(context)
                                    .requestFocus(_passwordFocusNode);
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text("PassWord",
                                style: TextStyle(
                                    fontFamily: "Poppins-Medium",
                                    fontSize: 16)),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12.0)),
                              controller: _passwordTextController,
                              focusNode: _passwordFocusNode,
                              validator: (String value) {
                                if (value.isEmpty || value.length < 6) {
                                  return 'Password invalid';
                                }
                              },
                              textInputAction: TextInputAction.done,
                              onSaved: (String value) {
                                _formData['password'] = value;
                              },
                              onFieldSubmitted: (v) {
                                print("pass submit");
                                _checkConn();
                              },
                              onEditingComplete: () {
                                print("pass compelte");
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xFF17ead9),
                                      Color(0xFF6078ea)
                                    ]),
                                    borderRadius: BorderRadius.circular(6.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color(0xFF6078ea).withOpacity(.3),
                                          offset: Offset(0.0, 8.0),
                                          blurRadius: 8.0)
                                    ]),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () => _checkConn(),
                                    highlightColor: Colors.blue,
                                    child: Center(
                                      child: Text('SIGNIN',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins-Bold",
                                              fontSize: 20,
                                              letterSpacing: 1.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontFamily: "Poppins-Medium",
                                      fontSize: 16),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
