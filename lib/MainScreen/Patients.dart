import 'package:flutter/material.dart';

import '../Patient/AllPatientReading.dart';
import '../Patient/PatientReading.dart';
import '../Patient/SearchPatient.dart';
import '../Patient/add_a_patient.dart';
import '../Patient/messages.dart';
import '../Patient/search_for_patient.dart';
import 'Dashboard.dart';

class Patients extends StatefulWidget {
  Patients({super.key});

  @override
  State<Patients> createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:   Text("Patients", style: TextStyle(fontSize: getFontSize(27, context), fontWeight: FontWeight.w500),),
        actions: [
          IconButton(
            icon: Icon(Icons.stars_rounded, size: getFontSize(36, context),),
            onPressed: () {
              // Search logic here
            },
          ),
        ],
      ),
      body: Padding(padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>
                      AddAPatient()));
                },
                child:
                actions(
                context,
                Icons.add,
                 "Add new patient",

              ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>
                      Messages()));
                },
                child:
              actions(
                  context,
                 Icons.message,
                 "Message Patient"
              ),
              ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder)=>
                    AllPatientReading()));
              },
              child:
              actions(
                  context,
                 Icons.edit_note,
                 "patient reading"
              ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>
                      SearchPatient()));
                },
                child:
                actions(
                  context,
                 Icons.search,
                 "Search for patient",
              ),
              ),
            ],
          ),
          SizedBox(height: getFontSize(30, context),),
          Align(
            alignment: Alignment.centerLeft,
            child:
          Text("Requests from patients", style: TextStyle(fontWeight: FontWeight.w600 ,fontSize: getFontSize(20, context)),),),
          SizedBox(height: getFontSize(14, context),),
          Expanded(
            child:
          SingleChildScrollView(
            child: Column(
              children: [
                request_tile(
                    name: "Olorunsogo Janet",
                    profile_path: "assets/images/doc.png",
                    date: "12th Jun 2022"
                ),
                request_tile(
                    name: "Salami Kelvin",
                    profile_path: "assets/images/doc.png",
                    date: "12th Jun 2022"
                ),
                request_tile(
                    name: "Olorunsogo Janet",
                    profile_path: "assets/images/doc.png",
                    date: "12th Jun 2022"
                ),
                request_tile(
                    name: "Salami Kelvin",
                    profile_path: "assets/images/doc.png",
                    date: "12th Jun 2022"
                ),request_tile(
                    name: "Olorunsogo Janet",
                    profile_path: "assets/images/doc.png",
                    date: "12th Jun 2022"
                ),
                request_tile(
                    name: "Salami Kelvin",
                    profile_path: "assets/images/doc.png",
                    date: "12th Jun 2022"
                ),
                request_tile(
                    name: "Olorunsogo Janet",
                    profile_path: "assets/images/doc.png",
                    date: "12th Jun 2022"
                ),
                request_tile(
                    name: "Salami Kelvin",
                    profile_path: "assets/images/doc.png",
                    date: "12th Jun 2022"
                ),
              ],
            ),
          )
          )

        ],
      ),
      ),
    );
  }


  request_tile({
    required String name,
    required profile_path, // Pass the profile path
    required String date
  }){
    return Container(
      child: Column(
        children: [
          SizedBox(height: getFontSize(5, context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getFontSize(55, context),
                height: getFontSize(55, context),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(profile_path),
                )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: getFontSize(18, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: getFontSize(5, context),),
                  SizedBox(height: getFontSize(2, context)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Requesting to be a patient"
                      ,
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: getFontSize(10, context)),

              Column(
                children: [
              Container(
                width: getFontSize(79, context),
                height: getFontSize(27, context),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed:(){

                  }, // Trigger the callback
                  child: Text(
                    "View details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getFontSize(12, context),
                    ),
                  ),
                ),
              ),
                  SizedBox(height: getFontSize(10, context),),
                  Text(date, style: TextStyle(fontSize: getFontSize(11, context)),)
              ]
          )
            ],
          ),
          SizedBox(height: getFontSize(5, context)),
          SizedBox(
            width: getFontSize(350, context),
            child: Divider(
              color: Colors.grey[300],
            ),
          )
        ],
      ),
    );
  }
}

actions(
    BuildContext context,
    IconData icon,
    String text
    ) {
  return Container(
      height: getFontSize(112, context),
      child: Column(
        children: [
          Container(
            padding:  EdgeInsets.all(getFontSize(12, context)),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffE2EDFF)
            ),
            child: Icon(icon, size: getFontSize(36, context), color: Colors.blue,),
          ),
          SizedBox(height: getFontSize(12, context),),
          SizedBox(
            width: getFontSize(65, context),
            child:  Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: getFontSize(13, context),  fontWeight: FontWeight.w400),),
          )
        ],
      )
  );
}
