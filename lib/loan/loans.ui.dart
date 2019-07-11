import 'package:emi_engagement/loan/loan.server.dart';
import 'package:emi_engagement/loan/loan_model.dart';
import 'package:emi_engagement/loan/widgets/loan_item.widget.dart';
import 'package:emi_engagement/login/login.local.dart';
import 'package:emi_engagement/user_profile/user_model.dart';
import 'package:flutter/material.dart';

class LoansUi extends StatefulWidget {
  @override
  _LoansUiState createState() => _LoansUiState();
}

class _LoansUiState extends State<LoansUi> {
  List<LoanModel> loans = List();
  bool isLoading = true;
  UserModel userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserSharedPreference.getLoggedInUser().then((user) {
      userModel = user;
      LoanServer.getLoans(userModel.email).then((loans) {
        isLoading = false;
        this.loans = loans;
        setState(() {});
      }).catchError((error) {});
    }).catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: loans.length,
              itemBuilder: (context, index) {
                LoanModel model = loans[index];
                return LoanItemWidget(model);
              }),
    );
  }
}

/*
  addLoan() {
    LoanModel loanModel = LoanModel(
        "Vivek Yadav",
        "viveky259259@gmail.com",
        "8097357765",
        400000,
        3000,
        7.6,
        "Ghar ka paper",
        24,
        10,
        10000,
        2,
        DateTime(2018, 1, 21),
        DateTime(2018, 2, 21));
    LoanServer.addLoan(loanModel).then((val) {
      print("loan uploaded");
    }).catchError((err) {
      print("loan not uploaded");
      print(err);
    });
  }

 */
