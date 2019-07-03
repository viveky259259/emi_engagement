import 'package:emi_engagement/chat_bot/chat.bot.ui.dart';
import 'package:emi_engagement/recommendation/recommendation.model.dart';
import 'package:emi_engagement/recommendation/widgets/recommendation_item.widget.dart';
import 'package:flutter/material.dart';

class DashboardUi extends StatefulWidget {
  @override
  _DashboardUiState createState() => _DashboardUiState();
}

class _DashboardUiState extends State<DashboardUi>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Stepper a;
  RecommendationModel recommendationModel;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    recommendationModel = RecommendationModel(
        "1",
        "Awesome title",
        "Awesome sub title",
        "Awesome description desc Awesome description desc Awesome description desc Awesome description desc Awesome description desc Awesome description desc Awesome description desc Awesome description desc Awesome description desc",
        ["assets/illustration.png", "assets/illustration.png"],
        2500.0,
        3.2,
        "Ghar ka paper"
    );
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
      body:Center(
        child: RecommendationItemWidget(this.recommendationModel),
      ),
    );
  }
}
