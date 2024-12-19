import 'package:pharmacy_app/Onboarding/onboarding2.dart';
import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';

import '../components/my_blue_button.dart';

class Onboarding1 extends StatelessWidget {
  Onboarding1({super.key});

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
                height: getFontSize(20, context),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/onboarding1.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: getFontSize(40, context),
              ),
              Center(
                child: Image.asset(
                  "assets/images/onboardingframe1.png",
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
                    width: getFontSize(340, context),
                    height: getFontSize(80, context),
                    child: Text(
                      "You can register a patient under you, and always get notified of the patient's vial readings so if things start going out of hand, you can always step in.",
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
                            builder: (context) => Onboarding2(),
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
