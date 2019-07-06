import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emi_engagement/constants/database_collections.dart';
import 'package:emi_engagement/leaderboard/leaderboard.model.dart';

class LeaderBoardServer {
  fetchLeaderBoard() {
    var complete = Completer();
    Firestore db = Firestore.instance;
    CollectionReference leaderBoardRef =
        db.collection(DatabaseCollections.LEADERBOARD_COLLECTION);

    leaderBoardRef.getDocuments().then((querySnapshot) {
      List<LeaderBoardModel> leaderBoards = List();
      querySnapshot.documents.forEach((each) {
        leaderBoards.add(
            LeaderBoardModel.fromJSON(each.data)..documentId = each.documentID);
      });
      complete.complete(leaderBoards);
    }).catchError((error) {
      complete.completeError(error);
    });
    return complete.future;
  }

  updateLeaderBoard(String email, int pointsToAdd) {
    
  }
}
