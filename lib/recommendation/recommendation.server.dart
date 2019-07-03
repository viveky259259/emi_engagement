import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emi_engagement/constants/database_collections.dart';
import 'package:emi_engagement/recommendation/recommendation.model.dart';
import 'package:emi_engagement/user_profile/user_model.dart';

class RecommendationServer {
  static addRecommendation(RecommendationModel model) {
    //add recommendations to server
    Firestore db = Firestore.instance;
    CollectionReference recommendationRef =
        db.collection(DatabaseCollections.RECOMMENDATION_COLLECTION);

    recommendationRef.add({
      "title": model.title,
      "subtitle": model.subTitle,
      "description": model.description,
      "images": model.images,
      "processing_fee": model.processingFees,
      "created": new DateTime.now().millisecondsSinceEpoch,
      "interest_rate": model.intrestRate,
      "collaterals": model.collaterals
    }).then((val) {
      print("send");
    }).catchError((err) {
      print(err);
    });
  }

  static addRecommendationToUser(UserModel user, RecommendationModel model) {
    //add recommendations to server
    Firestore db = Firestore.instance;
    CollectionReference recommendationRef =
        db.collection(DatabaseCollections.USER_RECOMMENDATION_COLLECTION);

    recommendationRef.add({
      "title": model.title,
      "subtitle": model.subTitle,
      "description": model.description,
      "images": model.images,
      "processing_fee": model.processingFees,
      "created": new DateTime.now().millisecondsSinceEpoch,
      "interest_rate": model.intrestRate,
      "collaterals": model.collaterals,
      "recommendation_id": model.id,
      "user_email": user.email
    }).then((val) {
      print("send");
    }).catchError((err) {
      print(err);
    });
  }

  static getRecommendationForUser(String userEmail) {
    Completer completer = Completer();
    //add recommendations to server
    Firestore db = Firestore.instance;
    CollectionReference recommendationRef =
        db.collection(DatabaseCollections.USER_RECOMMENDATION_COLLECTION);
    recommendationRef
        .where("user_email", isEqualTo: userEmail)
        .getDocuments()
        .then((querySnapshot) {
      List<RecommendationModel> recommendations = List();
      querySnapshot.documents.forEach((each) {
        recommendations.add(RecommendationModel.fromJSON(each.data));
      });
      completer.complete(recommendations);
    }).catchError((error) {
      completer.completeError(error);
    });
    return completer.future;
  }
}
