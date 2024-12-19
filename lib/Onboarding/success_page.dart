import 'package:pharmacy_app/Onboarding/login_page.dart';
import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import '../components/my_blue_button.dart';

class SuccessPage extends StatelessWidget {
  SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getFontSize(25, context)),
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: getFontSize(120, context),
              ),
              Text(
                "Success!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getFontSize(28, context),
                ),
              ),
              SizedBox(
                height: getFontSize(20, context),
              ),
              Column(
                children: [
                  Text(
                    "Your account has been created",
                    style: TextStyle(
                        color: Colors.grey, fontSize: getFontSize(14, context)),
                  ),
                  Text(
                    "successfully",
                    style: TextStyle(
                        color: Colors.grey, fontSize: getFontSize(14, context)),
                  )
                ],
              ),
              SizedBox(
                height: getFontSize(100, context),
              ),
              Image.asset(
                "assets/images/unboardinglogo.png",
                scale: 4,
              ),
              Spacer(),
              GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage())),
                  child: MyBlueButton(text: "Continue to Login")),
              SizedBox(
                height: getFontSize(40, context),
              )
            ],
          )),
        ),
      ),
    );
  }
}
