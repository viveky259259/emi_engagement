class ChatMessageModel {
  String message;
  String userId;
  bool isBot;
  DateTime dateTime;

  ChatMessageModel(this.message, this.userId, this.isBot, this.dateTime);
}
