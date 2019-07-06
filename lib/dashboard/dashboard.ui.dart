
import 'package:emi_engagement/chat_bot/chat.bot.ui.dart';
import 'package:emi_engagement/home/home.ui.dart';
import 'package:emi_engagement/leaderboard/leaderboard.ui.dart';
import 'package:emi_engagement/loan/loans.ui.dart';
import 'package:emi_engagement/user_profile/user_model.dart';
import 'package:emi_engagement/user_profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

class DashboardUi extends StatefulWidget {
  @override
  _DashboardUiState createState() => _DashboardUiState();
}

class _DashboardUiState extends State<DashboardUi>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Stepper a;
  UserModel userModel;

  int currentIndex;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    userModel = UserModel("1", "Vivek", "viveky259259@gmail.com", "8097357765");

    currentIndex=0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  getUiToDisplay(index){
    switch(index){
      case 0: return HomeUi();
      case 1:return  LoansUi();
      case 2: return LeaderBoardUi();
      case 3: return ProfileScreen();
    }
  }
  @override
  Widget build(BuildContext context) {
    void changePage(int index) {
      setState(() {
        currentIndex = index;
      });
    }
    return Scaffold(
      appBar: AppBar(
        leading: null,
        primary: true,
        centerTitle: true,
        title: Text("${userModel.name}'s dashboard"),
      ),
      body: getUiToDisplay(currentIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatBotUi()));
        },
        child: Icon(Icons.chat),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      resizeToAvoidBottomPadding: true,
      bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          currentIndex: currentIndex,
          onTap: changePage,
//          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          fabLocation: BubbleBottomBarFabLocation.end, //new
          hasNotch: false, //new
          hasInk: false, //new, gives a cute ink effect
          inkColor: Colors.black12, //optional, uses theme color if not specified
      items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(backgroundColor: Colors.red, icon: Icon(Icons.dashboard, color: Colors.black,), activeIcon: Icon(Icons.dashboard, color: Colors.red,), title: Text("Home")),
      BubbleBottomBarItem(backgroundColor: Colors.deepPurple, icon: Icon(Icons.access_time, color: Colors.black,), activeIcon: Icon(Icons.access_time, color: Colors.deepPurple,), title: Text("Loans")),
      BubbleBottomBarItem(backgroundColor: Colors.indigo, icon: Icon(Icons.equalizer, color: Colors.black,), activeIcon: Icon(Icons.equalizer, color: Colors.indigo,), title: Text("Leaderboard")),
      BubbleBottomBarItem(backgroundColor: Colors.green, icon: Icon(Icons.face, color: Colors.black,), activeIcon: Icon(Icons.face, color: Colors.green,), title: Text("Profile"))
      ],
    ),
    );
  }
}

