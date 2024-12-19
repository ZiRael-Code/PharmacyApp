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
  const PatientReadingComp(
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
          //     MaterialPageRoute(builder: (context) => const PatientReading()));
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 18),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(width: 0.7, color: Colors.black12)),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label
                  Container(
                    padding: const EdgeInsets.symmetric(
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
                  const SizedBox(height: 12.0),
                  // User Information
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage(path), // Replace with your image asset
                        radius: 24.0,
                      ),
                      const SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            '$time · $date',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Divider(
                        color: Colors.grey[300],
                      )),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'BP: ',
                            style: TextStyle(color: Colors.blue, fontSize: 11),
                          ),
                          Text(bp, style: const TextStyle(fontSize: 11)),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'HbA1c: ',
                            style: TextStyle(color: Colors.blue, fontSize: 11),
                          ),
                          Text(hba1c, style: const TextStyle(fontSize: 11)),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'IHRA: ',
                            style: TextStyle(color: Colors.blue, fontSize: 11),
                          ),
                          Text(ihra, style: const TextStyle(fontSize: 11)),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Oxygen: ',
                            style: TextStyle(color: Colors.blue, fontSize: 11),
                          ),
                          Text(oxy, style: const TextStyle(fontSize: 11)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Positioned(
                  right: 0,
                  child: Container(
                    width: 13,
                    height: 13,
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
