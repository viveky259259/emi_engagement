import 'package:emi_engagement/chat_bot/chat.message.model.dart';
import 'package:emi_engagement/chat_bot/widgets/chat.message.widget.dart';
import 'package:emi_engagement/common_widgets/common_app_bar.dart';
import 'package:flutter/material.dart';

class ChatBotUi extends StatefulWidget {
  @override
  _ChatBotUiState createState() => _ChatBotUiState();
}

class _ChatBotUiState extends State<ChatBotUi>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<ChatMessageModel> chats = [
    ChatMessageModel("Hi ", "1", false, DateTime.now()),
    ChatMessageModel("Hi ", "1", false, DateTime.now()),
    ChatMessageModel("Hi ", "1", false, DateTime.now()),
    ChatMessageModel("Hi ", "1", true, DateTime.now()),
    ChatMessageModel("Hi ", "1", false, DateTime.now()),
    ChatMessageModel("Hi ", "1", true, DateTime.now()),
    ChatMessageModel("Hi ", "1", false, DateTime.now()),
    ChatMessageModel("Hi ", "1", true, DateTime.now()),
    ChatMessageModel("Hi ", "1", false, DateTime.now()),
    ChatMessageModel("Hi ", "1", true, DateTime.now()),
    ChatMessageModel("Hi ", "1", false, DateTime.now()),
  ];
  TextEditingController messageController = TextEditingController();

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
    return SafeArea(
      child: Scaffold(
          appBar: CommonAppBar.getCommonAppBar("Assistant"),
          body: Column(
            children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                ChatMessageModel chat = chats[index];
                return ChatMessageWidget(chat);
              }),
              Expanded(
                child: Container(
                  height: 100,
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Enter message",
                      hintMaxLines: 2,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
