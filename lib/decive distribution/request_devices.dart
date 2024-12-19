import 'package:pharmacy_app/decive%20distribution/SelectPickupLocation.dart';
import 'package:pharmacy_app/decive%20distribution/checkout.dart';

import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/item_tile.dart';
import '../components/my_blue_button.dart';
import '../components/my_white_button.dart';
import '../home delivery/set_your_location.dart';

class RequestDevices extends StatefulWidget {
  RequestDevices({super.key});

  @override
  State<RequestDevices> createState() => _RequestDevicesState();
}

class _RequestDevicesState extends State<RequestDevices> {
  void _showQuickActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset("assets/images/rec.svg"),
              Text(
                "Select delivery method ",
                style: TextStyle(
                  fontSize: getFontSize(18, context),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getFontSize(20, context)),
              GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectYourLocation())),
                  child: MyBlueButton(text: "Set delivery location")),
              SizedBox(
                height: getFontSize(20, context),
              ),
              GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Selectpickuplocation())),
                  child: MyWhiteButton(text: "Select pickup location")),
              SizedBox(height: getFontSize(20, context)),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getFontSize(15, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: getFontSize(40, context)),
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
                SizedBox(height: getFontSize(20, context)),
                Center(
                  child: Container(
                    width: getFontSize(273, context),
                    height: getFontSize(70, context),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Do you want to be a distributor?",
                      style: TextStyle(
                        fontSize: getFontSize(28, context),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: getFontSize(30, context)),
                Container(
                  width: getFontSize(302, context),
                  height: getFontSize(75, context),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Select which device(s) you want to order",
                    style: TextStyle(
                        fontSize: getFontSize(14, context), color: Colors.grey),
                  ),
                ),
                SizedBox(height: getFontSize(20, context)),
                SizedBox(
                  height: getFontSize(325, context),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [ItemTile(), ItemTile(), ItemTile()],
                  ),
                ),
                SizedBox(height: getFontSize(80, context)),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (builder) => Checkout())),
                  child: MyBlueButton(
                    text: "Continue",
                  ),
                ),
                SizedBox(height: getFontSize(20, context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
