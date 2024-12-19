import 'package:pharmacy_app/add%20patients/set_network.dart';
import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/my_blue_button.dart';

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
              Padding(
                padding: EdgeInsets.only(top: getFontSize(40, context)),
                child: Row(
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
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: getFontSize(20, context),
                      bottom: getFontSize(20, context)),
                  child: Text(
                    "Success!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getFontSize(28, context),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: getFontSize(256, context),
                height: getFontSize(47, context),
                child: Text(
                  textAlign: TextAlign.center,
                  "You have successfully added patients to your hospital network.",
                  style: TextStyle(
                    fontSize: getFontSize(14, context),
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SetupNetwork())),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: getFontSize(30, context)),
                    child: MyBlueButton(text: "Done"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
