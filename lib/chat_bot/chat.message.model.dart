class ChatMessageModel {
  String message;
  String userEmail;
  String userName;
  bool isBot;
  DateTime dateTime;
  String repliedMessage;

  ChatMessageModel(
      this.message, this.userEmail, this.userName, this.isBot, this.dateTime,
      {this.repliedMessage});

  static fromJson(Map<String, dynamic> map) {
    return ChatMessageModel(map["message"], map["email"], map["name"],
        map["is_bot"], DateTime.now(),
        repliedMessage: map["replied_message"]);
  }
}
