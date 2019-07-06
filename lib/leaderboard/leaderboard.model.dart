class LeaderBoardModel {
  String email;
  int points;
  int position;
  String name;
  String documentId;

  LeaderBoardModel(this.email, this.points, this.position, this.name);

  factory LeaderBoardModel.fromJSON(Map<String, dynamic> map) {
    return LeaderBoardModel(
        map["email"], map["points"], map["position"], map["name"]);
  }

  Map<String, dynamic> toJSON() {
    return {
      "name": name,
      "email": email,
      "points": points,
      "position": position
    };
  }
}
