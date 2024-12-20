import 'package:flutter_svg/svg.dart';
import 'package:pharmacy_app/Account/Referral/my_blue_button.dart';
import 'package:pharmacy_app/MainScreen/Dashboard.dart';
import 'package:pharmacy_app/Onboarding/upload_id_card.dart';
import 'package:pharmacy_app/components/my_white_button.dart';
import 'package:flutter/material.dart';

class VerifyIdentity extends StatelessWidget {
  VerifyIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                SizedBox(
                  height: getFontSize(80, context),
                ),
                Text(
                  "Verify Identity",
                  style: TextStyle(
                    fontSize: getFontSize(28, context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: getFontSize(20, context),
                ),
                Container(
                  width: getFontSize(270, context),
                  height: getFontSize(75, context),
                  child: Text(
                    "Verify your identity as a medical specalist. You will be needed to upload or take a photo of your license.",
                    style: TextStyle(
                      fontSize: getFontSize(14, context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // image
                Stack(
                  children: [
                    Center(
                      child: Container(
                        margin:
                            EdgeInsets.only(top: getFontSize(80.5, context)),
                        child: Image.asset(
                          "assets/images/Group 803.png",
                          width: getFontSize(215, context),
                          height: getFontSize(215, context),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                          margin: EdgeInsets.only(
                              top: getFontSize(35, context),
                              right: getFontSize(15, context)),
                          child: SvgPicture.asset("assets/images/id-card.svg")),
                    ),
                  ],
                ),

                Spacer(),

                GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UploadIdCard(),
                          ),
                        ),
                    child: MyBlueButton(text: "Continue")),
                SizedBox(
                  height: getFontSize(20, context),
                ),
                MyWhiteButton(text: "I'll do this later")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
