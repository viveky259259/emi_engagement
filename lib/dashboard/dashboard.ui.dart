import 'package:emi_engagement/chat_bot/chat.bot.ui.dart';
import 'package:flutter/material.dart';

class DashboardUi extends StatefulWidget {
  @override
  _DashboardUiState createState() => _DashboardUiState();
}

class _DashboardUiState extends State<DashboardUi>
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
    return Scaffold(
      appBar: AppBar(
        leading: null,
        primary: true,
        centerTitle: true,
        title: Text("Vivek's dashboard"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ChatBotUi()));
          },
          child: Text("Chat bot"),
        ),
      ),
    );
  }
}
