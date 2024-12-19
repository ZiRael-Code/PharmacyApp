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
  const vitals_reading_comp({
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
          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const CollapsibleCalendar()));
        },
        child: Container(
          margin: const EdgeInsets.all(9.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(width: 0.7, color: Colors.black12),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(50)),
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(iconPath),
              ),
              const SizedBox(width: 12.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 16)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Device: $deviceName',
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(reading,
                      style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('$timestamp . $datestamp',
                      style: const TextStyle(fontSize: 10)),
                ],
              )
            ],
          ),
        ));
  }
}
