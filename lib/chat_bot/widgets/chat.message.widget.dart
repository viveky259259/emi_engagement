import 'package:emi_engagement/chat_bot/chat.message.model.dart';
import 'package:emi_engagement/constants/colors.constants.dart';
import 'package:emi_engagement/constants/textstyles.constants.dart';
import 'package:flutter/material.dart';

class ChatMessageWidget extends StatefulWidget {
  final ChatMessageModel chatMessageModel;

  ChatMessageWidget(this.chatMessageModel);

  @override
  _ChatMessageWidgetState createState() => _ChatMessageWidgetState();
}

class _ChatMessageWidgetState extends State<ChatMessageWidget> {
  String getDateInStringToShow(DateTime date) {
    if (date == null) return "00:00";
    return date.hour.toString() + ":" + date.minute.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.chatMessageModel.isBot
          ? Alignment.centerRight
          : Alignment.centerLeft,
      margin: EdgeInsets.only(
          left: (!widget.chatMessageModel.isBot) ? 64 : 0,
          right: (widget.chatMessageModel.isBot) ? 64 : 0,
          bottom: 8),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              elevation: 2,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      gradient: LinearGradient(colors: [
                        ColorConstants.messageCardGradient1,
                        ColorConstants.messageCardGradient2
                      ])),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.chatMessageModel.message,
                        style: TextStyleConstants.primaryMessageCard,
                      ),
                      (widget.chatMessageModel.repliedMessage != null &&
                              widget.chatMessageModel.repliedMessage != "")
                          ? LayoutBuilder(
                              builder: (context, constraints) {
                                return Container(
                                    width: constraints.maxWidth,
                                    padding: const EdgeInsets.only(
                                        left: 16.0, top: 8, bottom: 8),
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))),
                                    child: Text(
                                      widget.chatMessageModel.repliedMessage,
                                      style: TextStyleConstants
                                          .secondaryMessageCard,
                                    ));
                              },
                            )
                          : SizedBox()
                    ],
                  )),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text(getDateInStringToShow(widget.chatMessageModel.dateTime)),
          SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
