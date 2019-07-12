import 'package:emi_engagement/chat_bot/chat.message.model.dart';
import 'package:emi_engagement/chat_bot/chat.server.dart';
import 'package:emi_engagement/chat_bot/widgets/chat.message.widget.dart';
import 'package:emi_engagement/common_widgets/common_app_bar.dart';
import 'package:emi_engagement/constants/colors.constants.dart';
import 'package:emi_engagement/constants/database_collections.dart';
import 'package:emi_engagement/login/login.local.dart';
import 'package:emi_engagement/user_profile/user_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatBotUi extends StatefulWidget {
  @override
  _ChatBotUiState createState() => _ChatBotUiState();
}

class _ChatBotUiState extends State<ChatBotUi>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Firestore db = Firestore.instance;
  CollectionReference reference;
  List<ChatMessageModel> chats = [];
  ScrollController scrollController;
  UserModel userModel;
  TextEditingController messageController = TextEditingController();
  bool isBotEnabled = false;
  String repliedOldMessage = "";
  bool isLoading = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    scrollController = ScrollController();

    super.initState();
    reference = db.collection(DatabaseCollections.USER_CHATS);

    UserSharedPreference.getLoggedInUser().then((user) {
      userModel = user;
      setState(() {});
    }).catchError((error) {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  sendMessage() {
    if (messageController.text.length == 0) return;
    ChatMessageModel message = ChatMessageModel(messageController.text,
        userModel.email, userModel.name, isBotEnabled, DateTime.now(),
        repliedMessage: repliedOldMessage);
    ChatServer.addMessageToServer(
        message, userModel, (isBotEnabled) ? repliedOldMessage : "");
    repliedOldMessage = "";
    messageController.text = "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: CommonAppBar.getCommonAppBar("Assistant",
          bgColor: ColorConstants.messageCardGradient2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          (userModel != null)
              ? Expanded(
                  child: StreamBuilder(
                    stream: reference
                        .where("email", isEqualTo: userModel.email)
                        .orderBy("created", descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      var snapshots =
                          snapshot.hasData ? snapshot.data.documents : null;

                      return !snapshot.hasData
                          ? Center(
                              child: Text(
                                "No Chat History. Start converation!!",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.black),
                              ),
                            )
                          : ListView.builder(
                              itemCount: snapshots.length,
                              reverse: true,
                              itemBuilder: (context, index) {
                                if (snapshots == null) return Container();
                                Map<String, dynamic> dataMap =
                                    snapshots[index].data;

                                ChatMessageModel chat =
                                    ChatMessageModel.fromJson(dataMap);
                                if (index == 0)
                                  repliedOldMessage = chat.message;
                                return ChatMessageWidget(chat);
                              });
                    },
                  ),
                )
              : Center(child: CircularProgressIndicator()),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                      hintText: "Enter message",
                      contentPadding: EdgeInsets.all(16),
                      border: InputBorder.none),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isBotEnabled = !isBotEnabled;
                  });
                },
                child: Container(
                  height: 48,
                  width: 48,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: isBotEnabled ? Colors.black26 : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Image.asset(
                    "assets/icon.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: ColorConstants.messageCardGradient2,
                ),
                onPressed: () {
                  sendMessage();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
