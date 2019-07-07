import 'package:emi_engagement/loan/loan.server.dart';
import 'package:emi_engagement/loan/widgets/loan_item.widget.dart';
import 'package:emi_engagement/login/login.local.dart';
import 'package:emi_engagement/user_profile/user_model.dart';
import 'package:flutter/material.dart';
import 'package:emi_engagement/constants/textstyles.constants.dart';
import 'package:emi_engagement/credit/credit_model.dart';
import 'package:emi_engagement/customized_code/flutter_xlider.dart';
import 'package:emi_engagement/delegates/date_delegates.dart';
import 'package:emi_engagement/loan/loan_model.dart';
import 'package:emi_engagement/recommendation/recommendation.model.dart';
import 'package:emi_engagement/recommendation/widgets/recommendation_item.widget.dart';

class HomeUi extends StatefulWidget {
  @override
  _HomeUiState createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  RecommendationModel recommendationModel;
  CreditModel creditModel;
  UserModel userModel;
  List<RecommendationModel> recommendations = List();
  bool isLoansLoading = true;
  List<LoanModel> loans = List();

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    recommendations.add(recommendationModel = RecommendationModel(
        "1",
        "Awesome title",
        "Awesome sub title",
        "Awesome description desc Awesome description desc Awesome description desc Awesome description desc Awesome description desc Awesome description desc Awesome description desc Awesome description desc Awesome description desc",
        ["assets/illustration.png", "assets/illustration.png"],
        2500.0,
        3.2,
        "Ghar ka paper"));
    recommendations.add(recommendationModel = RecommendationModel(
        "1",
        "Awesome title",
        "Awesome sub title",
        "Awesome description desc Awesome description desc Awesome description desc Awesome description desc Awesome description desc Awesome description desc Awesome description desc Awesome description desc Awesome description desc",
        ["assets/illustration.png", "assets/illustration.png"],
        4500.0,
        5.2,
        "Ghar ka paper"));

    creditModel = CreditModel("viveky259259@gmail.com", 765, "Good",
        "Paisa Bazar", DateTime(2019, 5, 23));

    UserSharedPreference.getLoggedInUser().then((user) {
      userModel = user;
      LoanServer.getLoans(userModel.email).then((loans) {
        isLoansLoading = false;
        this.loans = loans;
        setState(() {});
      }).catchError((error) {});
    }).catchError((error) {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16),
            child: Text("Installments paid",
                style: TextStyleConstants.primaryText),
          ),
          (isLoansLoading)
              ? Container(
                  height: 250,
                  child: Center(child: CircularProgressIndicator()),
                )
              : (loans.length == 0)
                  ? Container(
                      height: 250,
                      child: Text("No loans available"),
                    )
                  : Container(
                      height: 250,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: loans.length,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            LoanModel model = loans[index];

                            return Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  FlutterSlider(
                                    values: [model.installmentsPaid.toDouble()],
                                    max: model.totalInstallments.toDouble(),
                                    min: 0,
                                    onDragging: null,
                                    disabled: true,
                                  ),
                                  LoanItemWidget(model,isColorFulRequired: true,),
                                ],
                              ),
                            );
                          }),
                    ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8),
            child: Text("Credit score", style: TextStyleConstants.primaryText),
          ),
          Card(
            elevation: 4,
            margin: EdgeInsets.only(top: 4, right: 24, left: 24),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
//                  color: Color(0x11679f98),
                  border: Border.all(
                    color: Color(0xaa679f98),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              padding: EdgeInsets.only(top: 16,),
//              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 24),
              child: Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "300",
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      new ClipPath(
                        clipper: new CustomHalfCircleClipper(),
                        child: new Container(
                          height: 150.0,
                          width: 150.0,
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(top: 24),
                          decoration: new BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 8),
                              borderRadius: BorderRadius.circular(150.0)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "${creditModel.creditScore}",
                                style: TextStyle(fontSize: 24),
                              ),
                              Text(
                                "${creditModel.creditHealth}",
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "900",
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      )
                    ],
                  ),
                  Positioned(
                    top: 91,
                    right: 16,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Generated on ${DateDelegate.getDateInString(creditModel.lastGeneratedAt)}",
                          style: TextStyleConstants.secondaryText,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "by ${creditModel.scoreGeneratorCompany}",
                          style: TextStyleConstants.secondaryText,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8),
            child:
                Text("Recommendations", style: TextStyleConstants.primaryText),
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 16, top: 8),
              shrinkWrap: true,
              itemCount: recommendations.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                RecommendationModel model = recommendations[index];
                return RecommendationItemWidget(model);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16),
            child: Text("Offers", style: TextStyleConstants.primaryText),
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 16, top: 8),
              shrinkWrap: true,
              itemCount: recommendations.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                RecommendationModel model = recommendations[index];
                return RecommendationItemWidget(model);
              },
            ),
          )
        ],
      ),
    );
  }
}

class CustomHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = new Path();
    path.lineTo(0.0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
