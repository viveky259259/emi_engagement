class LoanPaymentModel {
  String email;
  String name;
  int numOfInstallment;
  String loanId;
  double amountPaid;
  DateTime dateOfPayment;

  LoanPaymentModel(this.email, this.name, this.numOfInstallment, this.loanId,
      this.amountPaid, this.dateOfPayment);

  factory LoanPaymentModel.fromJSON(Map<String, dynamic> map) {
    DateTime paymentDate =
        DateTime.fromMicrosecondsSinceEpoch(map["date_of_payment"] * 1000);
    return LoanPaymentModel(
        map["email"],
        map["name"],
        map["num_of_installment"],
        map["loan_id"],
        map["amount_paid"],
        paymentDate);
  }

  toMap() {
    return {
      "email": email,
      "name": name,
      "num_of_installment": numOfInstallment,
      "loan_id": loanId,
      "amount_paid": amountPaid,
      "date_of_payment": dateOfPayment.millisecondsSinceEpoch
    };
  }
}
