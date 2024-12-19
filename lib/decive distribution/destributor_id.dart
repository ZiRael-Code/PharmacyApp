import 'package:pharmacy_app/decive%20distribution/request_devices.dart';

import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/my_blue_button.dart';

class DestributorId extends StatelessWidget {
  DestributorId({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getFontSize(15, context)),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: EdgeInsets.only(top: getFontSize(40, context)),
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
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: getFontSize(20, context)),
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
              ),
              Padding(
                padding: EdgeInsets.only(top: getFontSize(30, context)),
                child: Container(
                  width: getFontSize(302, context),
                  height: getFontSize(75, context),
                  child: Text(
                    textAlign: TextAlign.center,
                    "You get a special serial ID when you become a distributor. This ID is attached to the devices, so when someone buys from you, we can verify the purchase.",
                    style: TextStyle(
                        fontSize: getFontSize(14, context), color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: getFontSize(140, context),
                    bottom: getFontSize(10, context)),
                child: Text("Serial ID:"),
              ),
              Container(
                width: getFontSize(242, context),
                height: getFontSize(50, context),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    "87ORWYFHY-8GO46REG8",
                    style: TextStyle(
                        fontSize: getFontSize(16, context),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: getFontSize(10, context),
                    bottom: getFontSize(20, context)),
                child: Container(
                  width: getFontSize(79, context),
                  height: getFontSize(28, context),
                  decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/Union.svg"),
                        SizedBox(
                          width: getFontSize(4, context),
                        ),
                        Text(
                          "Copy",
                          style: TextStyle(
                              fontSize: getFontSize(12, context),
                              color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: getFontSize(30, context)),
                child: Text(
                  "**You can always check it in Account > Devices > Distributor ID",
                  style: TextStyle(
                      fontSize: getFontSize(10, context), color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: getFontSize(40, context)),
                child: GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RequestDevices())),
                    child: MyBlueButton(text: "Continue")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
