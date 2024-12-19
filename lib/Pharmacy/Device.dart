import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Device extends StatefulWidget {
  Device({super.key});

  @override
  State<Device> createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( child: Column(
        children: [
          SizedBox(height: getFontSize(25, context),),
          recomendDevice(
            name: "Wellue BP2 Connect Device",
            measures: "Measures 1 vital",
            image: "assets/images/printer.svg",
            prices: "N25,000",
          ),
          SizedBox(height: getFontSize(15, context),),
          recomendDevice(
            name: "Wellue BP2 Connect Device",
            measures: "Measures 1 vital",
            image: "assets/images/printer.svg",
            prices: "N25,000",
          ),

          SizedBox(height: getFontSize(15, context),),
          recomendDevice(
            name: "Wellue BP2 Connect Device",
            measures: "Measures 1 vital",
            image: "assets/images/printer.svg",
            prices: "N25,000",
          ),

        ],
      )
      )
    );
  }

recomendDevice({
  required String name,
  required String measures,
  required String image,
  required String prices,
}) {
  return Container(
    padding: EdgeInsets.all(18),
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black.withOpacity(0.1),
        width: getFontSize(1, context),
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getFontSize(16, context),
                ),
              ),
              SizedBox(height: getFontSize(8, context)),
              Container(
                margin: EdgeInsets.only(left: getFontSize(10, context)),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(measures),
              ),
              SizedBox(height: getFontSize(8, context)),
              Text(
                prices,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: getFontSize(20, context),
                ),
              ),
              SizedBox(height: getFontSize(16, context)),

              Row(
                children: [
                  Text("Qty left:"),
                  SizedBox(width: getFontSize(13, context)),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200
                    ),
                    child: Text("95"),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(height: getFontSize(15, context)),
        Container(
          padding: EdgeInsets.all(12),
          height: getFontSize(110, context),
          width: getFontSize(110, context),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.20),
            borderRadius: BorderRadius.circular(50),
          ),
          child: SvgPicture.asset(image),
        ),
      ],
    ),
  );
}
}
