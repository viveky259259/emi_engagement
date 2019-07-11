List<HelpCard> helpCard = <HelpCard>[
  HelpCard(
      questionsName: 'How do I change the registered email id on the account?',
      answerName:
          'You can change your registered e-mail id through any of the following banking channel \n 1.Mobile Banking\n 2.Internet Banking\n 3.Banking/Customer Service Point\n 4.IVR/ Customer Care Number'),
  HelpCard(
      questionsName:
          'How do I change the existing correspondence address on my account?',
      answerName:
          'You can change the address through any of the channels are Mobile Banking'),
  HelpCard(
      questionsName: 'Can I change my Correspondence/communication address?',
      answerName:
          'Yes, you can change your local address By logging in to your Mobile Banking App and updating your Correspondence/communication address'),
  HelpCard(
      questionsName: 'What all services are available through IVR?',
      answerName:
          'Service available through IVR mentioned below\n 1.Card Hotlisting\n 2.PIN Change\n 3.Statement Request (E-Statement / Physical)\n 4.Balance Enquiry\n 5.Last 5 transactions\n 6.Fraud/Unauthorized transaction Reporting'),
  HelpCard(
      questionsName: 'Who can open an APBP Savings Account?',
      answerName:
          'An individual resident in India who is 18 years and above, has a valid Aadhaar number and active mobile connection is eligible to open an APBP Savings Account.'),
  HelpCard(
      questionsName: 'What are the types of Savings Accounts offered by ABPB?',
      answerName:
          'Currently ABPB offers only Individual Savings Account (i.e., held in sole name) using the Aadhar eKYC based authentication service of Unique Identification Authority of India (UIDAI)'),
  HelpCard(
      questionsName:
          'What are the benefits of opening an account using a Biometric based e-KYC authentication method?',
      answerName:
          'The Savings Account opened using the Biometric based e-KYC authentication method does not have the restrictions which an OTP based account has. However, the end of day balance in the APBP Saving Account cannot exceed INR One Lakh.'),
  HelpCard(
      questionsName: 'Can I open Joint Savings Account with APBP?',
      answerName:
          'No, Currently you can open only individual Savings Account with ABPB.'),
  HelpCard(
      questionsName:
          'What is the rate of interest applicable on my Savings Account?',
      answerName:
          'ABPB will pay weekly interest at the rate of 4% per annum. The same will be calculated on the daily end of day balance held in the Savings Account.\nInterest Rate is subject to changes depending on the Bank’s Internal policy on the same.'),
  HelpCard(
      questionsName:
          'What is the minimum balance to be maintained in the account?',
      answerName:
          'You can enjoy the benefits of ZERO balance account while banking with ABPB. You need not worry of maintaining a balance in your savings account.'),
  HelpCard(
      questionsName:
          'Do I need to provide any documentary proof to change my correspondence address on my account?',
      answerName:
          'To change your correspondence address, you need not provide any documentary proof but just provide a declaration'),
];

class HelpCard {
  String questionsName;
  String answerName;

  HelpCard({this.questionsName, this.answerName});
}
