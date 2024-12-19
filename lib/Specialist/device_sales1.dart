import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../MainScreen/Dashboard.dart';
import 'device_sales2.dart';

class DeviceSales1 extends StatefulWidget {
  DeviceSales1({super.key});

  @override
  State<DeviceSales1> createState() => _DeviceSales1State();
}

class _DeviceSales1State extends State<DeviceSales1> {
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
        body: Padding(padding: EdgeInsets.all(12),
    child: Column(
    children: [
      SizedBox(height: getFontSize(25, context),),
      SizedBox(
        child: Text("Track devices sales to see which retailers  have paid for devices or not. ", textAlign: TextAlign.center,),
      ),
      Spacer(),
      SvgPicture.asset("assets/images/rafiki.svg"),
      Spacer(),
      SvgPicture.asset("assets/images/twodot.svg"),
      SizedBox(height: getFontSize(12, context),),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder:
              (builder)=>DeviceSales2()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: getFontSize(12.0, context), horizontal: getFontSize(24.0, context)),
          child: Text(
            'Continue',
            style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
          ),
        ),
      ),
      SizedBox(height: getFontSize(16, context),),
      ]
    )
    )
    );
  }
}
