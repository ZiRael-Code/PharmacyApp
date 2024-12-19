import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Account/Referral/my_blue_button.dart';

class SendInvitesSuccessPage extends StatelessWidget {
  SendInvitesSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getFontSize(25, context)),
          child: Column(
            children: [
              SizedBox(height: getFontSize(40, context)),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: getFontSize(35, context),
                      height: getFontSize(35, context),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFFE5E5E5),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/back.svg',
                        width: getFontSize(8.0, context),
                        height: getFontSize(15, context),
                      ),
                    ),
                  ),
                  SizedBox(width: getFontSize(100, context)),
                  Center(
                    child: Text(
                      "Success",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFontSize(20, context),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getFontSize(120, context),
              ),
              SizedBox(
                width: getFontSize(260, context),
                height: getFontSize(71, context),
                child: Text(
                  textAlign: TextAlign.center,
                  "You have successfully sent invitation links, when they sign up, you get a commission.",
                  style: TextStyle(
                    fontSize: getFontSize(16, context),
                  ),
                ),
              ),
              Spacer(),
              MyBlueButton(text: "Done"),
              SizedBox(
                height: getFontSize(30, context),
              )
            ],
          ),
        ),
      ),
    );
  }
}