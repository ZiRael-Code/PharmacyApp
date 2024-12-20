import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// import '../AllPatientReading/Curiosity.dart';

class vitals_reading_comp extends StatelessWidget {
  final String iconPath;
  final String deviceName;
  final String name;
  final String reading;
  final String datestamp;
  final String timestamp;
  final Color color;
  vitals_reading_comp({
    super.key,
    required this.deviceName,
    required this.name,
    required this.reading,
    required this.datestamp,
    required this.timestamp,
    required this.iconPath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CollapsibleCalendar()));
        },
        child: Container(
          margin: EdgeInsets.all(9.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(width: getFontSize(0.7, context), color: Colors.black12),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(50)),
                width: getFontSize(50, context),
                height: getFontSize(50, context),
                padding: EdgeInsets.all(10),
                child: SvgPicture.asset(iconPath),
              ),
              SizedBox(width: getFontSize(12.0, context)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: getFontSize(16, context))),
                  SizedBox(
                    height: getFontSize(10, context),
                  ),
                  Text(
                    'Device: $deviceName',
                    style: TextStyle(fontSize: getFontSize(10, context)),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(reading,
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: getFontSize(16, context))),
                  SizedBox(
                    height: getFontSize(10, context),
                  ),
                  Text('$timestamp . $datestamp',
                      style: TextStyle(fontSize: getFontSize(10, context))),
                ],
              )
            ],
          ),
        ));
  }
}