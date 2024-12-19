import 'package:pharmacy_app/decive%20distribution/destributor_id.dart';

import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../MainScreen/MainNavigator.dart';
import '../components/my_blue_button.dart';

class DestributionOnboarding1 extends StatelessWidget {
  DestributionOnboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getFontSize(15, context),
              vertical: getFontSize(10, context)),
          child: Column(
            children: [
              Spacer(),
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
                child: Container(
                  width: getFontSize(273, context),
                  height: getFontSize(70, context),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Do you want to be a distributor?",
                    style: TextStyle(
                        fontSize: getFontSize(28, context),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: getFontSize(30, context),
              ),
              Container(
                width: getFontSize(302, context),
                height: getFontSize(75, context),
                child: Text(
                  textAlign: TextAlign.center,
                  "Become a distributor and sell devices to pharmacies, doctors and patients. Distributors are given discounts on device prices.",
                  style: TextStyle(
                      fontSize: getFontSize(14, context), color: Colors.grey),
                ),
              ),
              SizedBox(
                height: getFontSize(10, context),
              ),
              Image.asset("assets/images/distri.jpg"),
              Spacer(),
              GestureDetector(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DestributorId())),
                  child: MyBlueButton(text: "Yes, become a distributor")),
              SizedBox(
                height: getFontSize(10, context),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainNavigator(index: 0))),
                child: Container(
                  width: getFontSize(380, context),
                  height: getFontSize(54, context),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    "Not now",
                    style: TextStyle(
                        fontSize: getFontSize(16, context),
                        color: Colors.blue,
                        fontWeight: FontWeight.w500),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
