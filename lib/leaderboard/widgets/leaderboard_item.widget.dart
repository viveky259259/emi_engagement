import 'package:emi_engagement/constants/colors.constants.dart';
import 'package:emi_engagement/constants/textstyles.constants.dart';
import 'package:flutter/material.dart';

class LeaderBoardItemWidget extends StatelessWidget {
  String userName;
  int position;
  double points;
  bool isCircularBorder;

  LeaderBoardItemWidget(this.userName, this.position, this.points,
      {this.isCircularBorder = false});

  String getPositionSuffix(int position) {
    if (position == 1)
      return "ST";
    else if (position == 2)
      return "ND";
    else if (position == 3)
      return "RD";
    else
      return "TH";
  }

  Color getPositionColor(int position) {
    if (position == 1)
      return Color(0xfffad558);
    else if (position == 2)
      return Color(0xffaaa9af);
    else if (position == 3)
      return Color(0xffc26f35);
    else
      return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConstants.leaderBoardBackground,
          borderRadius: isCircularBorder
              ? BorderRadius.all(Radius.circular(30))
              : BorderRadius.all(Radius.circular(0))),
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "$position",
              style: TextStyle(
                color: getPositionColor(position),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(getPositionSuffix(position),
                style: TextStyle(
                  color: getPositionColor(position),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
        title: Text(
          "$userName",
          style: TextStyleConstants.mediumTextWhite,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "$points",
              style: TextStyleConstants.mediumBoldTextWhite,
            ),
            SizedBox(
              width: 8,
            ),
            Text("pts", style: TextStyleConstants.secondaryTextWhite),
          ],
        ),
      ),
    );
  }
}
