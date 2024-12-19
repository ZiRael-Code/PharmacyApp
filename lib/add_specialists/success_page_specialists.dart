import 'package:pharmacy_app/add_specialists/setup_network_specialists.dart';

import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessPageSpecialists extends StatelessWidget {
  SuccessPageSpecialists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getFontSize(15, context)),
        child: Column(
          children: [
            SizedBox(
              height: getFontSize(40, context),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: getFontSize(45, context),
                  height: getFontSize(45, context),
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
            ),
            SizedBox(
              height: getFontSize(20, context),
            ),
            Center(
              child: Text(
                "Success!",
                style: TextStyle(
                    fontSize: getFontSize(28, context),
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: getFontSize(20, context),
            ),
            Center(
              child: Container(
                width: getFontSize(256, context),
                height: getFontSize(47, context),
                child: Text(
                  textAlign: TextAlign.center,
                  "You have Successfully added physicans to you hospital network.",
                  style: TextStyle(
                      fontSize: getFontSize(14, context), color: Colors.grey),
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SetupNetworkPharmacy())),
              child: Padding(
                padding: EdgeInsets.only(bottom: getFontSize(40, context)),
                child: Container(
                  width: getFontSize(335, context),
                  height: getFontSize(54, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      border: Border.all(color: Colors.blue.shade50)),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
