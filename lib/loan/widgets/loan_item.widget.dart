import 'package:emi_engagement/constants/textstyles.constants.dart';
import 'package:emi_engagement/loan/loan.description.dart';
import 'package:emi_engagement/loan/loan_model.dart';
import 'package:flutter/material.dart';

class LoanItemWidget extends StatelessWidget {
  final LoanModel loanModel;
  final isColorFulRequired;

  LoanItemWidget(this.loanModel, {this.isColorFulRequired = false});

  @override
  Widget build(BuildContext context) {
    return (isColorFulRequired)
        ? Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoanDescription(loanModel)));
              },
              borderRadius: BorderRadius.circular(16),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
              ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.red, Colors.indigoAccent, Colors.black, Colors.black],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft),
                      border: Border.all(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(16)),
                  padding:
                      EdgeInsets.only(left: 16, bottom: 16, top: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Loan", style: TextStyleConstants.primaryTextWhite),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              "assets/rupee-indian.png",
                              height: 14,
                              width: 14,
                              color: Colors.white,
                            ),
                            Text(
                                " ${loanModel.loanAmount} at ${loanModel.interestRate}%",
                                style: TextStyleConstants.mediumTextWhiteBold),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            double paidRate = double.parse(
                                (loanModel.amountPaid / loanModel.loanAmount)
                                    .toStringAsFixed(2));
                            return Stack(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 20,
                                      width: constraints.maxWidth * paidRate,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomLeft: Radius.circular(8))),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 1,
                                      color: Colors.grey,
//                            margin: EdgeInsets.only(bottom: 8),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red.shade500,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8))),
                                      height: 20,
                                      alignment: Alignment.center,
                                      width: constraints.maxWidth -
                                          constraints.maxWidth * paidRate -
                                          1,
                                    )
                                  ],
                                ),
                                Center(
                                  child: Text(
                                    "${loanModel.amountPaid} Paid",
                                    style: TextStyleConstants.primaryTextWhite,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            double paidRate = double.parse(
                                (loanModel.installmentsPaid /
                                        loanModel.totalInstallments)
                                    .toStringAsFixed(2));
                            return Stack(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 20,
                                      width: constraints.maxWidth * paidRate,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomLeft: Radius.circular(8))),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 1,
                                      color: Colors.grey,
//                            margin: EdgeInsets.only(bottom: 8),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red.shade500,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8))),
                                      height: 20,
                                      alignment: Alignment.center,
                                      width: constraints.maxWidth -
                                          constraints.maxWidth * paidRate -
                                          1,
                                    )
                                  ],
                                ),
                                Center(
                                  child: Text(
                                    "${loanModel.totalInstallments - loanModel.installmentsPaid} installments remaining",
                                    style: TextStyleConstants.primaryTextWhite,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.only(left: 24, right: 24, top: 16),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoanDescription(loanModel)));
              },
              borderRadius: BorderRadius.circular(16),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
              ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red.shade400),
                      borderRadius: BorderRadius.circular(16)),
                  padding:
                      EdgeInsets.only(left: 16, bottom: 16, top: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Loan", style: TextStyleConstants.primaryText),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              "assets/rupee-indian.png",
                              height: 14,
                              width: 14,
                            ),
                            Text(
                                " ${loanModel.loanAmount} at ${loanModel.interestRate}%",
                                style: TextStyleConstants.mediumText),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            double paidRate = double.parse(
                                (loanModel.amountPaid / loanModel.loanAmount)
                                    .toStringAsFixed(2));
                            return Stack(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 20,
                                      width: constraints.maxWidth * paidRate,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomLeft: Radius.circular(8))),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 1,
                                      color: Colors.grey,
//                            margin: EdgeInsets.only(bottom: 8),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red.shade500,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8))),
                                      height: 20,
                                      alignment: Alignment.center,
                                      width: constraints.maxWidth -
                                          constraints.maxWidth * paidRate -
                                          1,
                                    )
                                  ],
                                ),
                                Center(
                                  child: Text(
                                    "${loanModel.amountPaid} Paid",
                                    style: TextStyleConstants.primaryTextWhite,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            double paidRate = double.parse(
                                (loanModel.installmentsPaid /
                                        loanModel.totalInstallments)
                                    .toStringAsFixed(2));
                            return Stack(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 20,
                                      width: constraints.maxWidth * paidRate,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomLeft: Radius.circular(8))),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 1,
                                      color: Colors.grey,
//                            margin: EdgeInsets.only(bottom: 8),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red.shade500,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8))),
                                      height: 20,
                                      alignment: Alignment.center,
                                      width: constraints.maxWidth -
                                          constraints.maxWidth * paidRate -
                                          1,
                                    )
                                  ],
                                ),
                                Center(
                                  child: Text(
                                    "${loanModel.totalInstallments - loanModel.installmentsPaid} installments remaining",
                                    style: TextStyleConstants.primaryTextWhite,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
