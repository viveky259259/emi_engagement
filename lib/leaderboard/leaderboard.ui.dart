import 'package:emi_engagement/constants/colors.constants.dart';
import 'package:emi_engagement/constants/textstyles.constants.dart';
import 'package:emi_engagement/leaderboard/widgets/leaderboard_item.widget.dart';
import 'package:flutter/material.dart';

class LeaderBoardUi extends StatefulWidget {
  @override
  _LeaderBoardUiState createState() => _LeaderBoardUiState();
}

class _LeaderBoardUiState extends State<LeaderBoardUi>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.leaderBoardBackground,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: ColorConstants.leaderBoardTopBackground,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24))),
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: LeaderBoardItemWidget(
                "Vivek",
                1,
                123,
                isCircularBorder: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                "Leaderboard",
                style: TextStyleConstants.secondaryTextWhite,
              ),
            ),
            LeaderBoardItemWidget("Vivek", 1, 123),
            LeaderBoardItemWidget("Vivek", 2, 120),
            LeaderBoardItemWidget("Vivek", 3, 113),
            LeaderBoardItemWidget("Vivek", 4, 101),
            LeaderBoardItemWidget("Vivek", 5, 97),
            LeaderBoardItemWidget("Vivek", 6, 96),
            LeaderBoardItemWidget("Vivek", 7, 91),
            LeaderBoardItemWidget("Vivek", 8, 87),
            LeaderBoardItemWidget("Vivek", 9, 84),
            LeaderBoardItemWidget("Vivek", 10, 81),
            LeaderBoardItemWidget("Vivek", 11, 80),
            LeaderBoardItemWidget("Vivek", 12, 70),
            LeaderBoardItemWidget("Vivek", 13, 53),
            LeaderBoardItemWidget("Vivek", 14, 51),
            LeaderBoardItemWidget("Vivek", 15, 45)
          ],
        ),
      ),
    );
  }
}
