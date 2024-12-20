import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy_app/Store/OrderDetails.dart';

import '../MainScreen/Dashboard.dart';


class PendingOrders extends StatefulWidget {
  const  PendingOrders({super.key});

  @override
  State<PendingOrders> createState() => _PendingOrdersState();
}

class _PendingOrdersState extends State<PendingOrders> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(22),
    child: SingleChildScrollView(
    child: Column(
      children: [
        p_order(
          icon: "assets/images/pill1.svg",
          order_type: "12/06/2022-Prescriptions",
          by: "Dr. Stephen",
          price: "N22,300",
        ),
        p_order(
          icon: "assets/images/save.svg",
          order_type: "2 Devices",
          by: "Janet Okoli",
          price: "N15,000",
        ),
        p_order(
          icon: "assets/images/pill1.svg",
          order_type: "12/06/2022-Prescriptions",
          by: "Dr. Stephen",
          price: "N22,300",
        ),
        p_order(
          icon: "assets/images/save.svg",
          order_type: "2 Devices",
          by: "Janet Okoli",
          price: "N15,000",
        ),
        p_order(
          icon: "assets/images/pill1.svg",
          order_type: "12/06/2022-Prescriptions",
          by: "Dr. Stephen",
          price: "N22,300",
        ),
        p_order(
          icon: "assets/images/save.svg",
          order_type: "2 Devices",
          by: "Janet Okoli",
          price: "N15,000",
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
    required String price}) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>OrderDetails()));
      },
        child: Column(
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
            Align(
              alignment: Alignment.topRight,
              child:
            Text(price, style: TextStyle(fontSize: getFontSize(18, context), fontWeight: FontWeight.bold)))
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
    )
    );
  }
}
