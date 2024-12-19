import 'package:pharmacy_app/decive%20distribution/destribution_onboarding1.dart';

import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/my_blue_button.dart';

class SetupNetworkPharmacy1 extends StatelessWidget {
  SetupNetworkPharmacy1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getFontSize(15, context),
            vertical: getFontSize(22, context)),
        child: Column(
          children: [
            Center(
              child: Text(
                "Setup network",
                style: TextStyle(
                    fontSize: getFontSize(28, context),
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: getFontSize(20, context),
            ),
            Container(
              width: getFontSize(260, context),
              height: getFontSize(58, context),
              child: Text(
                textAlign: TextAlign.center,
                "Setup your network and add patients, specialists and hospitals.",
                style: TextStyle(
                    fontSize: getFontSize(14, context), color: Colors.grey),
              ),
            ),
            SizedBox(
              height: getFontSize(40, context),
            ),
            SvgPicture.asset("assets/images/network.svg"),
            SizedBox(
              height: getFontSize(80, context),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: getFontSize(5, context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: getFontSize(90, context),
                        height: getFontSize(118, context),
                        child: Column(
                          children: [
                            Container(
                              width: getFontSize(78, context),
                              height: getFontSize(78, context),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[100]),
                              child: Center(
                                child: SvgPicture.asset(
                                    "assets/images/person.svg"),
                              ),
                            ),
                            SizedBox(
                              height: getFontSize(20, context),
                            ),
                            Text(
                              "Add patients",
                              style:
                                  TextStyle(fontSize: getFontSize(12, context)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: getFontSize(26, context),
                        height: getFontSize(26, context),
                        decoration: BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                        child: Icon(Icons.check),
                      ),
                    ],
                  ),

                  // physicans
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: getFontSize(90, context),
                        height: getFontSize(118, context),
                        child: Column(
                          children: [
                            Container(
                              width: getFontSize(78, context),
                              height: getFontSize(78, context),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[100]),
                              child: Center(
                                  child: SvgPicture.asset(
                                      "assets/images/doctor.svg")),
                            ),
                            SizedBox(
                              height: getFontSize(20, context),
                            ),
                            Text(
                              "Add specailist",
                              style:
                                  TextStyle(fontSize: getFontSize(12, context)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: getFontSize(26, context),
                        height: getFontSize(26, context),
                        decoration: BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                        child: Icon(Icons.check),
                      ),
                    ],
                  ),

                  // pharmacy
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: getFontSize(90, context),
                        height: getFontSize(118, context),
                        child: Column(
                          children: [
                            Container(
                              width: getFontSize(78, context),
                              height: getFontSize(78, context),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[100]),
                              child: Center(
                                  child:
                                      SvgPicture.asset("assets/images/rx.svg")),
                            ),
                            SizedBox(
                              height: getFontSize(20, context),
                            ),
                            Text(
                              "Add pharmacy",
                              style:
                                  TextStyle(fontSize: getFontSize(12, context)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: getFontSize(26, context),
                        height: getFontSize(26, context),
                        decoration: BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                        child: Icon(Icons.check),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getFontSize(40, context),
            ),
            GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DestributionOnboarding1())),
                child: MyBlueButton(text: "Continue with setup"))
          ],
        ),
      )),
    );
  }
}
