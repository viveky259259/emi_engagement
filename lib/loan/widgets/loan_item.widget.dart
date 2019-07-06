import 'package:emi_engagement/loan/loan_model.dart';
import 'package:flutter/material.dart';

class LoanItemWidget extends StatelessWidget {
  final LoanModel loanModel;

  LoanItemWidget(this.loanModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(loanModel.doumentId),
    );
  }
}
