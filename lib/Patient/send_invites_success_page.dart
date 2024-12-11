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
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 35,
                      height: 35,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFFE5E5E5),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/back.svg',
                        width: 8.0,
                        height: 15,
                      ),
                    ),
                  ),
                  SizedBox(width: 100),
                  Center(
                    child: Text(
                      "Success",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 120,
              ),
              SizedBox(
                width: 260,
                height: 71,
                child: Text(
                  textAlign: TextAlign.center,
                  "You have successfully sent invitation links, when they sign up, you get a commission.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Spacer(),
              MyBlueButton(text: "Done"),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
