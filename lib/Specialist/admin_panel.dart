import 'package:pharmacy_app/Specialist/buy_device.dart';
import 'package:pharmacy_app/Specialist/custom_login.dart';
import 'package:pharmacy_app/Specialist/device_sales1.dart';

import '../MainScreen/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdminPanel extends StatefulWidget {
  AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
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
            Spacer(),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Admin panel',
                style: TextStyle(
                    fontSize: getFontSize(20, context),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              // Navigate to the next screen
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomLogin()));
            },
            child: panelMethod(
                text: "Custom Login",
                imagePath: "assets/images/key.svg",
                bottom: 'Setup custom login for staff'),
          ),
          GestureDetector(
            onTap: () {
              // Navigate to the next screen
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DeviceSales1()));
            },
            child: panelMethod(
                text: "Device sales",
                imagePath: "assets/images/cal.svg",
                bottom: 'Monitor device sales from affiliated partners'),
          ),
          GestureDetector(
            onTap: () {
              // Navigate to the next screen
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BuyDevice()));
            },
            child: panelMethod(
                text: "Buy device",
                imagePath: "assets/images/bag.svg",
                bottom: 'Order devices in bulk to sell to customers'),
          ),
        ],
      ),
    );
  }

  panelMethod({
    required String text,
    required String imagePath,
    bottom,
  }) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(12),
        width: double.infinity,
        height: getFontSize(74, context),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xFFE5E5E5),
            width: getFontSize(0.5, context),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: getFontSize(42, context),
              height: getFontSize(42, context),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFE2EDFF),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(imagePath),
            ),
            SizedBox(
              width: getFontSize(25, context),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Color(0xFF2E2E42),
                    fontSize: getFontSize(16, context),
                  ),
                ),
                bottom != null
                    ? SizedBox(
                        height: getFontSize(5, context),
                      )
                    : Container(),
                bottom != null
                    ? Text(
                        bottom,
                        style: TextStyle(
                          color: Color(0xFF959595),
                          fontSize: getFontSize(12, context),
                        ),
                      )
                    : Container()
              ],
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
