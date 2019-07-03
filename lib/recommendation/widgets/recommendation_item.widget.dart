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
            Positioned(
              right: -50,
              child: Container(
                width: 150,
                height: 200,
                alignment: Alignment.topRight,
                child: Transform(
                  transform: Matrix4.rotationY(3.14),
                  child: Image.asset(
                    model.images[0],
                    fit: BoxFit.fill,
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
                    style: TextStyleConstants.primaryRecommendationCard,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "${model.subTitle}",
                    style: TextStyleConstants.secondaryRecommendationCard,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Processing Fees:  ${model.processingFees}",
                    style: TextStyleConstants.secondaryRecommendationCard,
                  )
                ],
              ),
            ),
            Positioned(
//                top: 16,
                right: 0,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      gradient: LinearGradient(colors: [
                        ColorConstants.messageCardGradient1,
                        ColorConstants.messageCardGradient2
                      ])),
                  padding: EdgeInsets.all(16),
                  child: Center(
                      child: Text(
                    "@ ${model.intrestRate.toString()}%",
                    style:
                        TextStyleConstants.secondaryRecommendationIntrestCard,
                  )),
                ))
          ],
        ),
      ),
    );
  }
}
