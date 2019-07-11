import 'package:emi_engagement/common_widgets/common_app_bar.dart';
import 'package:emi_engagement/delegates/date_delegates.dart';
import 'package:emi_engagement/loan/loan_model.dart';
import 'package:emi_engagement/loan/loan_payment_model.dart';
import 'package:emi_engagement/payment/payment_home.dart';
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
  List<LoanPaymentModel> loansPaid = [
    LoanPaymentModel("vivek@gmi.com", "Vivek", 1, "aw", 1000, DateTime.now()),
    LoanPaymentModel("vivek@gmi.com", "Vivek", 2, "aw", 1000, DateTime.now()),
    LoanPaymentModel("vivek@gmi.com", "Vivek", 3, "aw", 1000, DateTime.now()),
    LoanPaymentModel("vivek@gmi.com", "Vivek", 4, "aw", 1000, DateTime.now()),
    LoanPaymentModel("vivek@gmi.com", "Vivek", 5, "aw", 1000, DateTime.now()),
    LoanPaymentModel("vivek@gmi.com", "Vivek", 6, "aw", 1000, DateTime.now()),
    LoanPaymentModel("vivek@gmi.com", "Vivek", 7, "aw", 1000, DateTime.now()),
    LoanPaymentModel("vivek@gmi.com", "Vivek", 8, "aw", 1000, DateTime.now()),
  ];

  List<Step> steps = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loansPaid.reversed.forEach((each) {
      steps.add(Step(
          title: Text("Installment ${each.numOfInstallment}"),
          state: StepState.complete,
          subtitle: Text("Amount paid: ${each.amountPaid}"),
          content: Text(
              "${each.name} has paid ${each.amountPaid} on ${DateDelegate.getDateInString(each.dateOfPayment)} for installment # ${each.numOfInstallment}")));
    });
    DateTime lastDate = loansPaid[loansPaid.length - 1].dateOfPayment;
    steps.insert(
        0,
        Step(
            state: StepState.indexed,
            title: Text("Installment ${steps.length + 1}"),
            subtitle: Text("Amount: ${loansPaid[0].amountPaid}"),
            content: Text(
                "${loansPaid[0].name} have to pay ${loansPaid[0].amountPaid} on ${DateDelegate.getDateInString(DateTime(lastDate.year, lastDate.month + 1, lastDate.day))} for installment # ${steps.length + 1}")));
  }

  int currentStep = 0;

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
              Container(
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
              Stepper(
                currentStep: currentStep,
                steps: steps,
                physics: NeverScrollableScrollPhysics(),
                onStepContinue: () {
                  if (currentStep < steps.length - 1) {
                    currentStep++;
                    setState(() {});
                  }
                },
                onStepTapped: (index) {
                  currentStep = index;
                  setState(() {});
                },
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  return Row(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          if (currentStep == 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Payhome()));
                          } else
                            onStepContinue();
                        },
                        child: Text(
                          currentStep == 0 ? 'Pay' : 'CONTINUE',
                          style: TextStyle(
                              color: (currentStep == 0)
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        color: (currentStep == 0)
                            ? Colors.blue
                            : Colors.transparent,
                      ),
                      (currentStep == 0)
                          ? SizedBox()
                          : FlatButton(
                              onPressed: onStepCancel,
                              child: const Text('CANCEL'),
                            ),
                    ],
                  );
                },
                onStepCancel: () {
                  if (currentStep > 0) {
                    currentStep--;
                    setState(() {});
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
