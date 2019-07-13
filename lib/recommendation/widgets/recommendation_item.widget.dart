import 'package:emi_engagement/constants/colors.constants.dart';
import 'package:emi_engagement/constants/textstyles.constants.dart';
import 'package:emi_engagement/recommendation/recommendation.model.dart';
import 'package:flutter/material.dart';

class RecommendationItemWidget extends StatelessWidget {
  final RecommendationModel model;

  RecommendationItemWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width -
            MediaQuery.of(context).size.width / 6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(colors: [
              ColorConstants.messageCardGradient1,
              ColorConstants.messageCardGradient2
            ])),
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(16.0),

//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.all(Radius.circular(16)),
//                ),
                child: Opacity(
                  opacity: 0.4,
                  child: Image.asset(
                    model.images[0],
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${model.title}",
                    style: TextStyleConstants.primaryRecommendationCardShadows,

                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "${model.subTitle}",
                    style: TextStyleConstants.secondaryRecommendationCardShadow,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Processing Fees:",
                        style: TextStyleConstants.secondaryRecommendationCardShadow,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        "assets/rupee-indian.png",
                        height: 14,
                        width: 14,
                        color: Colors.white,
                      ),
                      Text(
                        "${model.processingFees}",
                        style: TextStyleConstants.secondaryRecommendationCardShadow,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                top: 16,
                right: 16,

                child: Container(
//                  height: 75,
//                  width:75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      gradient: LinearGradient(colors: [
                        ColorConstants.messageCardGradient1,
                        ColorConstants.messageCardGradient2
                      ])),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "@ ${model.interestRate.toString()}%",
                    style:
                    TextStyleConstants.secondaryRecommendationIntrestCard,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
