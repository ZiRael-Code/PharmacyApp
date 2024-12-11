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
            icon: Icon(Icons.stars_rounded, size: 36,),
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
                 "Message specialists"
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
          SizedBox(height: 30,),
          Align(
            alignment: Alignment.centerLeft,
            child:
          Text("Requests from patients", style: TextStyle(fontWeight: FontWeight.w600 ,fontSize: getFontSize(20, context)),),),
          SizedBox(height: 14,),
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
          SizedBox(height: 5),
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
                  SizedBox(height: 5,),
                  SizedBox(height: 2),
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
              SizedBox(width: 10),

              Column(
                children: [
              Container(
                width: 79,
                height: 27,
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
                  SizedBox(height: 10,),
                  Text(date, style: TextStyle(fontSize: getFontSize(11, context)),)
              ]
          )
            ],
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 350,
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
    String text,
    ) {
  return  Column(
        children: [
          Container(
            padding:  EdgeInsets.all(getFontSize(12, context)),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffE2EDFF)
            ),
            child: Icon(icon, size: getFontSize(36, context), color: Colors.blue,),
          ),
          SizedBox(height: 12,),
          SizedBox(
            width: 62,
            child:  Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: getFontSize(13, context),  fontWeight: FontWeight.w400),),
          )
        ],
  );
}

