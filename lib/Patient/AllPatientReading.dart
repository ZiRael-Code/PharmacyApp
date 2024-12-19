import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'PatientReading.dart';
// import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MaterialApp(home: AllPatientReading()));
}

class AllPatientReading extends StatefulWidget {
  AllPatientReading({super.key});

  @override
  _AllPatientState createState() => _AllPatientState();
}

class _AllPatientState extends State<AllPatientReading> {
  List<Map<String, dynamic>> patientReadings = [
    {
      'name': 'Salami Adebayo',
      'path': 'assets/images/guy.png',
      'date': '12th Sept 2022',
      'time': '4:17pm',
      'bp': '90/60mmHg',
      'hba1c': '42mmol/mol',
      'ihra': '5.7%',
      'oxy': '95%',
      'regularity': 'irregular',
      'isOnline': true,
      'regularityColor': Color(0xffFF8E3C),
    },
    {
      'name': 'Fatima Abdullahi',
      'path': 'assets/images/guy.png',
      'date': '10th Oct 2022',
      'time': '3:30pm',
      'bp': '120/80mmHg',
      'hba1c': '48mmol/mol',
      'ihra': '6.5%',
      'oxy': '98%',
      'regularity': 'regular',
      'isOnline': false,
      'regularityColor': Color(0xffFF8E3C),
    },
    {
      'name': 'Adisa Asabe',
      'path': 'assets/images/guy.png',
      'date': '5th Nov 2022',
      'time': '1:00pm',
      'bp': '130/85mmHg',
      'hba1c': '50mmol/mol',
      'ihra': '7.0%',
      'oxy': '97%',
      'regularity': 'irregular',
      'isOnline': true,
      'regularityColor': Color(0xffFF8E3C),
    },
    {
      'name': 'Mary Johnson',
      'path': 'assets/images/guy.png',
      'date': '20th Aug 2022',
      'time': '9:45am',
      'bp': '110/70mmHg',
      'hba1c': '45mmol/mol',
      'ihra': '6.0%',
      'oxy': '96%',
      'regularity': 'regular',
      'isOnline': true,
      'regularityColor': Color(0xffFF8E3C),
    },
    {
      'name': 'Chinedu Obi',
      'path': 'assets/images/guy.png',
      'date': '15th July 2022',
      'time': '11:30am',
      'bp': '100/65mmHg',
      'hba1c': '40mmol/mol',
      'ihra': '5.5%',
      'oxy': '94%',
      'regularity': 'irregular',
      'isOnline': false,
      'regularityColor': Color(0xffFF8E3C),
    },
  ];
  List<Map<String, dynamic>> filteredList = [];
  List<String> btnText = [
    "Irregular",
    "Regular",
    "Doctor",
    "Gynaecologist",
    "Dentist",
    "Surgeon",
    "Surgeon",
    "Opthalmologist",
    "Others..."
  ];
  bool isFilterOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PatientReading()));
                  // Navigator.pop(context);
                },
                child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color(0xffE5E5E5), shape: BoxShape.circle),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Color(0xff666666),
                    )),
              ),
              Spacer(),
              Text('All Patient\'s Reading'),
              Spacer(),
            ])),
        body: Padding(
          padding: EdgeInsets.only(left: getFontSize(16, context), right: getFontSize(16, context), top: getFontSize(25, context)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: getFontSize(10, context),
                    height: getFontSize(10, context),
                    decoration: BoxDecoration(
                        color: Color(0xffE5E5E5), shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: getFontSize(8, context),
                  ),
                  Text('Unchecked'),
                  SizedBox(
                    width: getFontSize(8, context),
                  ),
                  Container(
                    width: getFontSize(10, context),
                    height: getFontSize(10, context),
                    decoration: BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: getFontSize(8, context),
                  ),
                  Text('Checked')
                ],
              ),
              SizedBox(
                height: getFontSize(20, context),
              ),
              Row(
                children: [
                  // Search field
                  Container(
                    padding: EdgeInsets.only(right: getFontSize(10, context)),
                    width: MediaQuery.of(context).size.width * 0.70,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          filteredList = patientReadings.where((item) {
                            return item['name']
                                .toLowerCase()
                                .contains(value.toLowerCase());
                          }).toList();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search by name, vital reading..',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: getFontSize(15, context)),
                      ),
                    ),
                  ),

                  // Filter icon
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFilterOpen = !isFilterOpen;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: getFontSize(5, context)),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: isFilterOpen
                          ? Icon(Icons.close, color: Colors.black)
                          : SvgPicture.asset('assets/images/filter.svg'),
                    ),
                  ),
                ],
              ),
              if (isFilterOpen)
                Container(
                  margin: EdgeInsets.only(top: getFontSize(16, context)),
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Filters",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: getFontSize(18, context),
                        ),
                      ),
                      SizedBox(height: getFontSize(20, context)), //
                      Wrap(
                        spacing: 5, //
                        runSpacing: 8, //
                        children: [
                          for (int i = 0; i <= btnText.length - 1; i++)
                            ElevatedButton(
                              onPressed: () {
                                // Button logic here
                              },
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                  color: i == btnText.length - 1
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: i == btnText.length - 1 ? 1.0 : 0.0,
                                ),
                                shadowColor: Colors.transparent,
                                backgroundColor: i == btnText.length - 1
                                    ? Colors.transparent
                                    : Color(0xFFE2EDFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  btnText[i],
                                  style: TextStyle(
                                      color: Color(0xff3C8AFF),
                                      fontSize: getFontSize(11.5, context)), // Button text color
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              SizedBox(
                height: getFontSize(20, context),
              ),
              Expanded(
                  child: ListView(
                children: List.generate(
                  filteredList.isEmpty
                      ? patientReadings.length
                      : filteredList.length,
                  (index) => InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PatientReading()));
                    },
                    child: patient_reading(
                      name: patientReadings[index]['name'],
                      path: patientReadings[index]['path'],
                      date: patientReadings[index]['date'],
                      time: patientReadings[index]['time'],
                      bp: patientReadings[index]['bp'],
                      hba1c: patientReadings[index]['hba1c'],
                      ihra: patientReadings[index]['ihra'],
                      oxy: patientReadings[index]['oxy'],
                      regularity: patientReadings[index]['regularity'],
                      isOnline: patientReadings[index]['isOnline'],
                      regularityColor: patientReadings[index]
                          ['regularityColor'],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ));
  }

  patient_reading({
    required String name,
    required String path,
    required String date,
    required String bp,
    required String hba1c,
    required String ihra,
    required String oxy,
    required String regularity,
    required Color regularityColor,
    required String time,
    required bool isOnline,
  }) {
    return Container(
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
                padding: EdgeInsets.symmetric(horizontal: getFontSize(8.0, context), vertical: getFontSize(4.0, context)),
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
    );
  }
}