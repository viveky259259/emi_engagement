import 'package:emi_engagement/chat_bot/chat.bot.ui.dart';
import 'package:emi_engagement/constants/colors.constants.dart';
import 'package:emi_engagement/dashboard/storage/local.storage.dart';
import 'package:emi_engagement/faqPage/ListPage.dart';
import 'package:emi_engagement/home/home.ui.dart';
import 'package:emi_engagement/leaderboard/leaderboard.ui.dart';
import 'package:emi_engagement/loan/loans.ui.dart';
import 'package:emi_engagement/login/login.local.dart';
import 'package:emi_engagement/user_profile/user_model.dart';
import 'package:emi_engagement/user_profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:achievement_view/achievement_view.dart';

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
  bool isNotificationRead = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    currentIndex = 0;
    initiateUser();
  }

  initiateUser() {
    UserSharedPreference.getLoggedInUser().then((user) {
      userModel = user;
      setState(() {});
      LocalStorage.storeTodaySFirstOpenDate().then((isStored) {
        if (isStored != null && isStored) {
          showAchievement("Congratulations",
              "You have earned 1 point for opening app today");
          LocalStorage.storeTodaySFirstOpenDate();
        }
      });
    }).catchError((error) {});
  }

  showAchievement(String title, String subtitle) {
    AchievementView(context,
        title: "$title!",
        subTitle: subtitle,
        duration: Duration(seconds: 3),
        isCircle: false, listener: (status) {
      print(status);
    })
      ..show();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  getUiToDisplay(index) {
    switch (index) {
      case 0:
        return HomeUi();
      case 1:
        return LoansUi();
      case 2:
        return LeaderBoardUi();
      case 3:
        return ProfileScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    void changePage(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    String getTitleSuffix(int index) {
      switch (index) {
        case 0:
          return "dashboard";
        case 1:
          return "loans";
        case 2:
          return "leaderboard";
        case 3:
          return "profile";
        default:
          return "app";
      }
    }

    Color getAppBarColor(int index) {
      switch (index) {
        case 0:
          return ColorConstants.messageCardGradient1;
        case 1:
          return Colors.red;
        case 2:
          return ColorConstants.leaderBoardTopBackground;
        case 3:
          return Colors.green;
        default:
          return Colors.blue;
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: null,
        primary: true,
        centerTitle: true,
        backgroundColor: getAppBarColor(currentIndex),
        title: (userModel != null)
            ? Text("${userModel.name}'s ${getTitleSuffix(currentIndex)}")
            : Text("Dashboard"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (!isNotificationRead) {
                showAchievement("Congratulations",
                    "You have earned 1 point for reading notification");
                isNotificationRead = true;
              }
            },
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ListPage()));
            },
            icon: Icon(
              Icons.help,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: getUiToDisplay(currentIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ChatBotUi()));
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
        fabLocation: BubbleBottomBarFabLocation.end,
        //new
        hasNotch: true,
        //new
        hasInk: true,

        //new, gives a cute ink effect
        inkColor: Colors.black12,
        //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: ColorConstants.messageCardGradient1,
              icon: Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              activeIcon: Icon(Icons.dashboard,
                  color: ColorConstants.messageCardGradient1),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.access_time,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.access_time,
                color: Colors.deepPurple,
              ),
              title: Text("Loans")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.equalizer,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.equalizer,
                color: ColorConstants.leaderBoardBackground,
              ),
              title: Text("Leaderboard")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                Icons.face,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.face,
                color: Colors.green,
              ),
              title: Text("Profile"))
        ],
      ),
    );
  }
}
