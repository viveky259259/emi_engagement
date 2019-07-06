import 'package:flutter/material.dart';

class LeaderBoardUi extends StatefulWidget {
  @override
  _LeaderBoardUiState createState() => _LeaderBoardUiState();
}

class _LeaderBoardUiState extends State<LeaderBoardUi> with SingleTickerProviderStateMixin {
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
    return Container();
  }
}
