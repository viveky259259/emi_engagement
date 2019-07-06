import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emi_engagement/constants/database_collections.dart';
import 'package:emi_engagement/loan/loan_model.dart';

class LoanServer {
  static getLoans(String email) async {
    Completer complete = Completer();
    Firestore db = Firestore.instance;
    CollectionReference loanRef =
        db.collection(DatabaseCollections.LOAN_COLLECTION);

    await loanRef.where("email", isEqualTo: email).getDocuments().then((value) {
      print(value);
      List<LoanModel> loans = List();
      value.documents.forEach((each) {
        LoanModel model = LoanModel.fromJSON(each.data);
        model.doumentId = each.documentID;
        loans.add(model);
      });

      complete.complete(loans);
    }).catchError((error) {
      print(error);
      complete.completeError(error);
    });
    return complete.future;
  }

  static addLoan(LoanModel loanModel) async {
    Completer complete = Completer();
    Firestore db = Firestore.instance;
    CollectionReference loanRef =
        db.collection(DatabaseCollections.LOAN_COLLECTION);

    loanRef.add(loanModel.toMap()).then((val) {
      complete.complete(true);
    }).catchError((error) {
      complete.completeError(error);
    });

    return complete.future;
  }
}
