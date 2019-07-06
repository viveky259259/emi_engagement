class RecommendationModel {
  String id;
  String title;
  String subTitle;
  String description;
  List<String> images;
  double processingFees;
  double interestRate;
  String collaterals;

  RecommendationModel(this.id, this.title, this.subTitle, this.description,
      this.images, this.processingFees, this.interestRate, this.collaterals);

  factory RecommendationModel.fromJSON(Map<String, dynamic> data) {
    return RecommendationModel(
        data["recommendation_id"],
        data["title"],
        data["subtitle"],
        data["description"],
        data["images"],
        data["processing_fee"],
        data["interest_rate"],
        data["collaterals"]);
  }
}
