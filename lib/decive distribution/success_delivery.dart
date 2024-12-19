import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/my_blue_button.dart';

class SuccessDelivery extends StatelessWidget {
  SuccessDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getFontSize(20, context)),
            child: Column(
              children: [
                SizedBox(
                  height: getFontSize(80, context),
                ),
                Text(
                  "Success!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getFontSize(28, context),
                  ),
                ),
                SizedBox(
                  height: getFontSize(10, context),
                ),
                Container(
                  width: getFontSize(258, context),
                  height: getFontSize(60, context),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Your account has been created successfully",
                    style: TextStyle(fontSize: getFontSize(14, context)),
                  ),
                ),
                SizedBox(
                  height: getFontSize(140, context),
                ),
                SvgPicture.asset("assets/images/successimg.svg"),
                Spacer(),
                MyBlueButton(text: "Continue to login"),
                SizedBox(
                  height: getFontSize(40, context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}