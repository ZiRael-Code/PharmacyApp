import 'package:pharmacy_app/Onboarding/onboarding3.dart';

import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';

import '../components/my_blue_button.dart';

class Onboarding2 extends StatelessWidget {
  Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              top: getFontSize(18, context), bottom: getFontSize(18, context)),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: getFontSize(25, context)),
                  child: Text(
                    "SKIP",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: getFontSize(14, context),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getFontSize(60, context),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/onboarding2.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: getFontSize(50, context),
              ),
              Center(
                child: Image.asset(
                  "assets/images/onboardingframe2.png",
                  scale: 4,
                ),
              ),
              SizedBox(
                height: getFontSize(20, context),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getFontSize(25, context)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: getFontSize(301, context),
                    height: getFontSize(71, context),
                    child: Text(
                      "Easily schedule appointments with your patients, either through a video/voice call or a physical appointment, right from the app.",
                      style: TextStyle(
                        fontSize: getFontSize(14, context),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getFontSize(25, context)),
                child: GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Onboarding3(),
                          ),
                        ),
                    child: MyBlueButton(text: "Continue")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
