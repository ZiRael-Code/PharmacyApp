import '../MainScreen/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../MainScreen/MainNavigator.dart';

class OrderPrescriptionSummary extends StatefulWidget {
  OrderPrescriptionSummary({super.key});

  @override
  State<OrderPrescriptionSummary> createState() =>
      _OrderPrescriptionSummaryState();
}

class _OrderPrescriptionSummaryState extends State<OrderPrescriptionSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Center(
                child: Text(
                  'Order prescription',
                  style: TextStyle(
                      fontSize: getFontSize(20, context),
                      fontStyle: FontStyle.normal),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: getFontSize(0.7, context), color: Colors.black26)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      width: getFontSize(61, context),
                      height: getFontSize(61, context),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage("assets/images/pharm1.jpeg"),
                      )),
                  SizedBox(
                    width: getFontSize(10, context),
                  ),
                  Column(
                    children: [
                      Text(
                        "Randy Blue pharmacy",
                        style: TextStyle(fontSize: getFontSize(17, context)),
                      ),
                      SizedBox(
                        height: getFontSize(5, context),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: getFontSize(4, context),
                              horizontal: getFontSize(8, context)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                  width: getFontSize(0.5, context),
                                  color: Colors.black26)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("View pharmacy",
                                  style: TextStyle(color: Colors.blue)),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.blue,
                              ),
                            ],
                          ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: getFontSize(15, context),
            ),
            Row(
              children: [
                Text("Drug name:    ",
                    style: TextStyle(fontSize: getFontSize(14, context))),
                Text(
                  "Ibuprofen 500mg x 24",
                  style: TextStyle(
                      fontSize: getFontSize(16, context),
                      color: Colors.blue,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              height: getFontSize(25, context),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Amount per pack",
                        style: TextStyle(fontSize: getFontSize(14, context))),
                    Text(
                      "N1,500",
                      style: TextStyle(
                          fontSize: getFontSize(16, context),
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("No of units:",
                        style: TextStyle(fontSize: getFontSize(14, context))),
                    Text(
                      "12 per pack",
                      style: TextStyle(
                          fontSize: getFontSize(16, context),
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            ),
            Spacer(),
            InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (builder) => MainNavigator(
                              index: 0,
                            )), // Navigate to Login screen
                    (Route<dynamic> route) =>
                        false, // Remove all previous routes
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue,
                  ),
                  padding: EdgeInsets.all(12),
                  child: Text(
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: getFontSize(16, context)),
                      "Continue"),
                ))
          ],
        ),
      ),
    );
  }
}
