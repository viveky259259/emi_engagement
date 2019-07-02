import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emi_engagement/chat_bot/chat.message.model.dart';
import 'package:emi_engagement/constants/database_collections.dart';
import 'package:emi_engagement/user_profile/user_model.dart';

class ChatServer {
  static addMessageToServer(
      ChatMessageModel message, UserModel userModel, String repliedOldMessage) {
    Firestore db = Firestore.instance;
    CollectionReference chatRef = db.collection(DatabaseCollections.USER_CHATS);

    chatRef.add({
      "name": userModel.name,
      "message": message.message,
      "email": userModel.email,
      "is_bot": message.isBot,
      "replied_message": repliedOldMessage,
      "created": new DateTime.now().millisecondsSinceEpoch,
      "mobile": userModel.mobile,
    }).then((val) {
      print("send");
    }).catchError((err) {
      print(err);
    });
  }
}
