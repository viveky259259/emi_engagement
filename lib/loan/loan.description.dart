import 'package:emi_engagement/common_widgets/common_app_bar.dart';
import 'package:emi_engagement/delegates/date_delegates.dart';
import 'package:emi_engagement/loan/loan_model.dart';
import 'package:flutter/material.dart';

class LoanDescription extends StatefulWidget {
  final LoanModel loanModel;

  LoanDescription(this.loanModel);

  @override
  _LoanDescriptionState createState() => _LoanDescriptionState();
}

class _LoanDescriptionState extends State<LoanDescription> {
  TextStyle variableTitle = TextStyle(color: Colors.black54, fontSize: 16);

  TextStyle variableValue =
      TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);
  var rowMainAxisAlignment = MainAxisAlignment.spaceBetween;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.getCommonAppBar("Loan Description",
          centerTitle: true, bgColor: Colors.red.shade900),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: rowMainAxisAlignment,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Customer", style: variableTitle),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.face,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  Text(
                    widget.loanModel.name,
                    style: variableValue,
                  )
                ],
              ),
              Divider(
                color: Colors.black12,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: rowMainAxisAlignment,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Email", style: variableTitle),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.email,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  Text(
                    widget.loanModel.email,
                    style: variableValue,
                  )
                ],
              ),
              Divider(
                color: Colors.black12,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: rowMainAxisAlignment,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Loan", style: variableTitle),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        "assets/rupee-indian.png",
                        height: 14,
                        width: 14,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  Text(
                    widget.loanModel.loanAmount.toString(),
                    style: variableValue,
                  )
                ],
              ),
              Divider(
                color: Colors.black12,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: rowMainAxisAlignment,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Total Amount Paid", style: variableTitle),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        "assets/rupee-indian.png",
                        height: 14,
                        width: 14,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  Text(
                    widget.loanModel.amountPaid.toString(),
                    style: variableValue,
                  )
                ],
              ),
              Divider(
                color: Colors.black12,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: rowMainAxisAlignment,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Processing fee", style: variableTitle),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        "assets/rupee-indian.png",
                        height: 14,
                        width: 14,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  Text(
                    widget.loanModel.processingFees.toString(),
                    style: variableValue,
                  )
                ],
              ),
              Divider(
                color: Colors.black12,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: rowMainAxisAlignment,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Interest rate", style: variableTitle),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "%",
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  ),
                  Text(
                    widget.loanModel.interestRate.toString(),
                    style: variableValue,
                  )
                ],
              ),
              Divider(
                color: Colors.black12,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: rowMainAxisAlignment,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Collaterals", style: variableTitle),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.assignment_turned_in,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  Text(
                    widget.loanModel.collaterals,
                    style: variableValue,
                  )
                ],
              ),
              Divider(
                color: Colors.black12,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: rowMainAxisAlignment,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Installments Paid", style: variableTitle),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.assessment,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  Text(
                    widget.loanModel.installmentsPaid.toString(),
                    style: variableValue,
                  )
                ],
              ),
              Divider(
                color: Colors.black12,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: rowMainAxisAlignment,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Total Installments", style: variableTitle),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.assistant,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  Text(
                    widget.loanModel.totalInstallments.toString(),
                    style: variableValue,
                  )
                ],
              ),
              Divider(
                color: Colors.black12,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: rowMainAxisAlignment,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Lapse Installments", style: variableTitle),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.cancel,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  Text(
                    widget.loanModel.lapseInstallments.toString(),
                    style: variableValue,
                  )
                ],
              ),
              Divider(
                color: Colors.black12,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: rowMainAxisAlignment,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Loan sactioned date", style: variableTitle),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.done_all,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  Text(
                    DateDelegate.getDateInString(
                        widget.loanModel.loanSanctionedDate),
                    style: variableValue,
                  )
                ],
              ),
              Divider(
                color: Colors.black12,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: rowMainAxisAlignment,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Loan apply date", style: variableTitle),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.done,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  Text(
                    DateDelegate.getDateInString(
                        widget.loanModel.loanApplyDate),
                    style: variableValue,
                  )
                ],
              ),
              Divider(
                color: Colors.black12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
