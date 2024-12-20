import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';

// import '../AllPatientReading/PatientReading.dart';

class PatientReadingComp extends StatelessWidget {
  final String name;
  final String path;
  final String date;
  final String time;
  final String bp;
  final String hba1c;
  final String ihra;
  final String oxy;
  final String regularity;
  final bool isOnline;
  final Color regularityColor;
  PatientReadingComp(
      {super.key,
      required this.name,
      required this.path,
      required this.date,
      required this.time,
      required this.bp,
      required this.hba1c,
      required this.ihra,
      required this.oxy,
      required this.regularity,
      required this.isOnline,
      required this.regularityColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          // Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => PatientReading()));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: getFontSize(18, context)),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(width: getFontSize(0.7, context), color: Colors.black12)),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: regularityColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      regularity,
                      style: TextStyle(
                        color: regularityColor,
                      ),
                    ),
                  ),
                  SizedBox(height: getFontSize(12.0, context)),
                  // User Information
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage(path), // Replace with your image asset
                        radius: 24.0,
                      ),
                      SizedBox(width: getFontSize(12.0, context)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: getFontSize(16.0, context),
                            ),
                          ),
                          SizedBox(height: getFontSize(4.0, context)),
                          Text(
                            '$time · $date',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: getFontSize(12.0, context),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: getFontSize(16.0, context)),
                  Padding(
                      padding: EdgeInsets.only(right: getFontSize(50, context)),
                      child: Divider(
                        color: Colors.grey[300],
                      )),
                  SizedBox(height: getFontSize(8.0, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            'BP: ',
                            style: TextStyle(color: Colors.blue, fontSize: getFontSize(11, context)),
                          ),
                          Text(bp, style: TextStyle(fontSize: getFontSize(11, context))),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'HbA1c: ',
                            style: TextStyle(color: Colors.blue, fontSize: getFontSize(11, context)),
                          ),
                          Text(hba1c, style: TextStyle(fontSize: getFontSize(11, context))),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'IHRA: ',
                            style: TextStyle(color: Colors.blue, fontSize: getFontSize(11, context)),
                          ),
                          Text(ihra, style: TextStyle(fontSize: getFontSize(11, context))),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Oxygen: ',
                            style: TextStyle(color: Colors.blue, fontSize: getFontSize(11, context)),
                          ),
                          Text(oxy, style: TextStyle(fontSize: getFontSize(11, context))),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Positioned(
                  right: getFontSize(0, context),
                  child: Container(
                    width: getFontSize(13, context),
                    height: getFontSize(13, context),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isOnline ? Colors.green : Colors.grey[300]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}