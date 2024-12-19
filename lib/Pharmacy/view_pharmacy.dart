import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy_app/Pharmacy/prescription_orders.dart';
import 'package:pharmacy_app/Pharmacy/purchase_device.dart';
import 'package:pharmacy_app/Pharmacy/view_inventory.dart';
import '../MainScreen/Dashboard.dart';

class ViewPharmacy extends StatefulWidget {
  ViewPharmacy({super.key});

  @override
  State<ViewPharmacy> createState() => _ViewPharmacyState();
}

class _ViewPharmacyState extends State<ViewPharmacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
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
              ),
            ),
            Spacer(),
            Container(
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  'Pharmacy',
                  style: TextStyle(
                      fontSize: getFontSize(20, context),
                      fontStyle: FontStyle.normal),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              actions(
                context,
                Icons.add,
                "Purchase devices",
                MaterialPageRoute(builder: (builder) => PurchaseDevice()),
              ),
              actions(context, "assets/images/inventory.svg", "View inventory",
                  MaterialPageRoute(builder: (builder) => ViewInventory())),
              actions(
                  context,
                  Icons.search,
                  "Prescription orders",
                  MaterialPageRoute(
                      builder: (builder) => PrescriptionOrders())),
            ]),
            SizedBox(
              height: getFontSize(16, context),
            ),
            Text(
              "Recent orders",
              style: TextStyle(
                  fontSize: getFontSize(18, context),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: getFontSize(10, context),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  orders(
                    context,
                    "assets/images/pill3.svg",
                    "12/06/2022",
                    "Prescription",
                    "N15,000",
                    "Janet Okoli",
                  ),
                  orders(
                    context,
                    "assets/images/save.svg",
                    "12/06/2022",
                    "Prescription",
                    "N15,000",
                    "Janet Okoli",
                  ),
                  orders(
                    context,
                    "assets/images/pill3.svg",
                    "12/06/2022",
                    "Prescription",
                    "N15,000",
                    "Janet Okoli",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getFontSize(25, context),
            ),
            Text(
              "Activities",
              style: TextStyle(
                  fontSize: getFontSize(18, context),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: getFontSize(25, context),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  activity_tile(
                      des: "A patient ordered a device",
                      icon_path: Icons.person,
                      date: "12 0ct 2022"),
                  activity_tile(
                      des: "Devices were added to the inventory",
                      icon_path: Icons.public,
                      date: "12 0ct 2022"),
                  activity_tile(
                      des: "Dr. Michael had an appointment with a patient",
                      icon_path: Icons.person,
                      date: "12 0ct 2022"),
                  activity_tile(
                      des: "Dr. Tristan joned your network",
                      icon_path: "assets/images/pill.svg",
                      date: "12 0ct 2022"),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  activity_tile(
      {required String des,
      required icon_path, // Pass the profile path
      required String date}) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: getFontSize(6, context)),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    width: getFontSize(1, context), color: Colors.black12)),
            child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: getFontSize(24, context),
                    horizontal: getFontSize(14, context)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff4BA33D).withOpacity(0.50)),
                          child: icon_path is String
                              ? SvgPicture.asset(
                                  icon_path,
                                  color: Colors.green,
                                )
                              : Icon(
                                  icon_path,
                                  color: Colors.green,
                                ),
                        ),
                        SizedBox(
                          width: getFontSize(12, context),
                        ),
                        Container(
                          width: getFontSize(190, context),
                          child: Text(
                            des,
                            style:
                                TextStyle(fontSize: getFontSize(15, context)),
                          ),
                        )
                      ],
                    ),
                  ],
                ))),
        Positioned(
            right: getFontSize(7, context),
            top: getFontSize(12, context),
            child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color(0xffE2EDFF),
                    borderRadius: BorderRadius.circular(18)),
                child: Text(
                  "12 0ct 2022",
                  style: TextStyle(
                      fontSize: getFontSize(10, context), color: Colors.blue),
                )))
      ],
    );
  }
}

orders(BuildContext context, String iconPath, String date, String type,
    String price, String by) {
  return Container(
    margin: EdgeInsets.only(right: getFontSize(10, context)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Colors.grey.shade400,
        width: getFontSize(1, context),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              SvgPicture.asset(
                iconPath,
              ),
              SizedBox(
                width: getFontSize(7, context),
              ),
              Text(
                "${date}-${type}",
                style: TextStyle(
                    fontSize: getFontSize(14, context), color: Colors.black45),
              )
            ],
          ),
        ),
        SizedBox(
          height: getFontSize(7, context),
        ),
        SvgPicture.asset(
          "assets/images/line.svg",
          width: getFontSize(230, context),
        ),
        Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(price,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFontSize(22, context))),
                SizedBox(
                  height: getFontSize(15, context),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: getFontSize(7, context),
                      horizontal: getFontSize(12, context)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.grey.shade300),
                  child: Row(
                    children: [
                      Text("By:  "),
                      Text(
                        by,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            ))
      ],
    ),
  );
}

activity(BuildContext context, String icon_path, String text, String date) {
  return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade400,
          width: getFontSize(1, context),
        ),
      ),
      child: Column(
        children: [],
      ));
}

actions(BuildContext context, icon, String text, MaterialPageRoute action) {
  return GestureDetector(
      onTap: () {
        Navigator.of(context).push(action);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(icon is String
                ? getFontSize(16, context)
                : getFontSize(12, context)),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xffE2EDFF)),
            child: icon is String
                ? SvgPicture.asset(icon)
                : Icon(
                    icon,
                    size: getFontSize(36, context),
                    color: Colors.blue,
                  ),
          ),
          SizedBox(
            height: getFontSize(12, context),
          ),
          SizedBox(
            width: getFontSize(72, context),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: getFontSize(13, context),
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ));
}
