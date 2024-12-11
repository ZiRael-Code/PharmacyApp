import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Patient/Curiosity.dart';


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
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CollapsibleCalendar()));
      },
        child: Container(
      margin: EdgeInsets.all(9.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(width: 0.7, color: Colors.black12),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(50)
            ),
            width: 50,
            height: 50,
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(iconPath),
          ),
          SizedBox(width: 12.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontSize: 16)),
              SizedBox(height: 10,),
              Text('Device: $deviceName', style: TextStyle(fontSize: 10),),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(reading, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 10,),
              Text('$timestamp . $datestamp', style: TextStyle(fontSize: 10)),
            ],
          )
        ],
      ),
    )
    );
  }
}
