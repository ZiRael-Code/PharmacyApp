import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy_app/Specialist/device_sales3.dart';
import '../MainScreen/Dashboard.dart';

class DeviceSales2 extends StatefulWidget {
  DeviceSales2({super.key});

  @override
  State<DeviceSales2> createState() => _DeviceSales2State();
}

class _DeviceSales2State extends State<DeviceSales2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                  'Device sales',
                  style: TextStyle(
                    fontSize: getFontSize(20, context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(12),
            child: Column(children: [
              SizedBox(
                height: getFontSize(25, context),
              ),
              SizedBox(
                child: Text(
                  "Have an overall view of the total amount of devices ordered and sold, and other statistics of the device sales.",
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              SvgPicture.asset("assets/images/mansales.svg"),
              Spacer(),
              SvgPicture.asset("assets/images/twodot.svg"),
              SizedBox(
                height: getFontSize(12, context),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (builder) => DeviceSales3()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getFontSize(12.0, context),
                      horizontal: getFontSize(24.0, context)),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: getFontSize(18, context)),
                  ),
                ),
              ),
              SizedBox(
                height: getFontSize(16, context),
              ),
            ])));
  }
}
