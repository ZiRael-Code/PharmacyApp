import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../MainScreen/Dashboard.dart';

class CompletedOrders extends StatefulWidget {
  const CompletedOrders({super.key});

  @override
  State<CompletedOrders> createState() => _CompletedOrdersState();
}

class _CompletedOrdersState extends State<CompletedOrders> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(12),
    child:  SingleChildScrollView(
        child: Column(
          children: [
            p_order(
              icon: "assets/images/pill1.svg",
              order_type: "12/06/2022-Prescriptions",
              by: "Dr. Stephen",
              date: "12th Jan 2022",
              status: "Completed",
            ),
            p_order(
              icon: "assets/images/save.svg",
              order_type: "2 Devices",
              by: "Janet Okoli",
              date: "12th Jan 2022",
              status: "Pending",
            ),
            p_order(
              icon: "assets/images/pill1.svg",
              order_type: "12/06/2022-Prescriptions",
              by: "Dr. Stephen",
              date: "12th Jan 2022",
              status: "Completed",
            ),
            p_order(
              icon: "assets/images/save.svg",
              order_type: "2 Devices",
              by: "Janet Okoli",
              date: "12th Jan 2022",
              status: "Pending"
            ),
            p_order(
              icon: "assets/images/pill1.svg",
              order_type: "12/06/2022-Prescriptions",
              by: "Dr. Stephen",
              date: "12th Jan 2022",
              status: "Pending",
            ),
            p_order(
              icon: "assets/images/save.svg",
              order_type: "2 Devices",
              by: "Janet Okoli",
              date: "12th Jan 2022",
              status: "Completed",
            ),
            p_order(
              icon: "assets/images/save.svg",
              order_type: "2 Devices",
              by: "Janet Okoli",
              date: "12th Jan 2022",
              status: "Completed",
            ),
          ],
        )
    )
    );
  }
  p_order({
    required String icon,
    required String order_type,
    required String by,
    required String date,
    required String status}) {
    Color color = status.toLowerCase().characters.first == 'c' ? Color(0xff1BE43B) : Color(0xffFFA135);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(icon),
                    SizedBox(width: getFontSize(7, context),),
                    Text(
                      order_type,
                      style: TextStyle(fontSize: getFontSize(14, context)),
                    ),
                  ],
                ),
                SizedBox(height: getFontSize(10, context),),
                Text("By: " + by,
                  style: TextStyle(fontSize: getFontSize(16, context), fontWeight: FontWeight.w500),
                )
              ],
            ),
            Spacer(),
            Column(
              children: [
            Text(date, style: TextStyle(fontSize: getFontSize(18, context), fontWeight: FontWeight.bold))
                ,SizedBox(height: getFontSize(7, context),),
                Container(
                  padding: EdgeInsets.only(right: getFontSize(13, context), left: getFontSize(13, context), bottom: getFontSize(7, context), top: getFontSize(7, context)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: color.withOpacity(0.15),
                  ),
                  child: Row(
                    children: [
                      Icon(size: getFontSize(13, context),status.toLowerCase().characters.first == 'c' ? Icons.check : Icons.access_time_rounded, color: color,),
                      SizedBox(width: getFontSize(7, context),),
                      Text(status, style: TextStyle(fontSize: getFontSize(14, context), color: color),)
                    ],
                  ),
                )
              ],
            )

            ,],
        ),
        SizedBox(height: getFontSize(10, context),),
        Divider(
          thickness: 1,
          color: Colors.black26,
        ),
        SizedBox(height: getFontSize(15, context),)
        ,SizedBox(height: getFontSize(15, context),),
      ],
    );
  }
}
