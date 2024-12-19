import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/my_blue_button.dart';

class DevicedOrdered extends StatelessWidget {
  DevicedOrdered({super.key});

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
                  "Device ordered",
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
                    "Your device has been ordered and will soon get to you. You will be notified once it is available.",
                    style: TextStyle(fontSize: getFontSize(14, context)),
                  ),
                ),
                SizedBox(
                  height: getFontSize(140, context),
                ),
                SvgPicture.asset("assets/images/Character.svg"),
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