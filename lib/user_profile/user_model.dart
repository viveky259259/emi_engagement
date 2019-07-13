class UserModel {
  final String uid, name, email, mobile, city, state, panCard;
  final int aadharNum;
  DateTime dob;

  UserModel(this.uid, this.name, this.email, this.mobile, this.city, this.state,
      this.panCard, this.aadharNum,
      {this.dob});
}
