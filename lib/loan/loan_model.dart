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
      this.loanApplyDate);
}
