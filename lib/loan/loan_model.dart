class LoanModel {
  String name;
  String email;
  String mobile;
  double loanAmount;
  double processingFees;
  double interestRate;
  String collaterals;
  int totalInstallments;
  int installmentsPaid;
  double amountPaid;
  int lapseInstallments;
  DateTime loanSanctionedDate;
  DateTime loanApplyDate;
  String doumentId;
  bool isCompleted;
  bool isActive;

  LoanModel(
      this.name,
      this.email,
      this.mobile,
      this.loanAmount,
      this.processingFees,
      this.interestRate,
      this.collaterals,
      this.totalInstallments,
      this.installmentsPaid,
      this.amountPaid,
      this.lapseInstallments,
      this.loanSanctionedDate,
      this.loanApplyDate,
      this.isActive,
      this.isCompleted);

  factory LoanModel.fromJSON(Map<String, dynamic> map) {
    DateTime loanSanctionedDate =
        DateTime.fromMicrosecondsSinceEpoch(map["loan_sactioned_date"] * 1000);
    DateTime loanApplyDate =
        DateTime.fromMicrosecondsSinceEpoch(map["loan_apply_date"] * 1000);
    return LoanModel(
        map["name"],
        map["email"],
        map["mobile"],
        map["loan_amount"],
        map["processing_fee"],
        map["interest_rate"],
        map["collaterals"],
        map["total_installments"],
        map["installments_paid"],
        map["amount_paid"],
        map["lapse_installments"],
        loanSanctionedDate,
        loanApplyDate,
        map["is_actice"],
        map["is_completed"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "mobile": mobile,
      "loan_amount": loanAmount,
      "processing_fee": processingFees,
      "interest_rate": interestRate,
      "collaterals": collaterals,
      "installments_paid": installmentsPaid,
      "total_installments": totalInstallments,
      "amount_paid": amountPaid,
      "lapse_installments": lapseInstallments,
      "loan_sactioned_date": loanSanctionedDate.millisecondsSinceEpoch,
      "loan_apply_date": loanSanctionedDate.millisecondsSinceEpoch,
      "is_active":isActive,
      "is_completed":isCompleted
    };
  }
}
