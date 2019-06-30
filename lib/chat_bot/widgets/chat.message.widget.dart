import 'package:emi_engagement/chat_bot/chat.message.model.dart';
import 'package:flutter/material.dart';

class ChatMessageWidget extends StatefulWidget {
  final ChatMessageModel chatMessageModel;

  ChatMessageWidget(this.chatMessageModel);

  @override
  _ChatMessageWidgetState createState() => _ChatMessageWidgetState();
}

class _ChatMessageWidgetState extends State<ChatMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.chatMessageModel.isBot
          ? Alignment.centerRight
          : Alignment.centerLeft,
      margin: widget.chatMessageModel.isBot
          ? EdgeInsets.only(left: 32)
          : EdgeInsets.only(right: 32),
      child: Card(
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(widget.chatMessageModel.message),
            Text(widget.chatMessageModel.dateTime.toLocal().toString())
          ],
        ),
      ),
    );
  }
}
