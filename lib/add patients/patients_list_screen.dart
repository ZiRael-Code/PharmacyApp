import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'patients_information.dart';

class Patient {
  String name;
  String phoneNumber;
  String location;

  Patient({
    required this.name,
    required this.phoneNumber,
    required this.location,
  });
}

class PatientListScreen extends StatefulWidget {
  final List<Patient> initialPatients;

  PatientListScreen({
    Key? key,
    required this.initialPatients,
  }) : super(key: key);

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  late List<Patient> _patients;

  @override
  void initState() {
    super.initState();
    _patients = widget.initialPatients;
  }

  void _addPatient(Patient newPatient) {
    setState(() {
      _patients.add(newPatient); // Add the new patient to the list
    });
  }

  void _editPatient(Patient updatedPatient, int index) {
    setState(() {
      _patients[index] = updatedPatient; // Update only the specified patient
    });
  }

  void _deletePatient(int index) {
    setState(() {
      _patients.removeAt(index); // Remove the patient from the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getFontSize(15, context)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: getFontSize(40, context)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: getFontSize(45, context),
                        height: getFontSize(45, context),
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
                    Padding(
                      padding: EdgeInsets.only(top: getFontSize(70, context)),
                      child: Text(
                        "Patient List",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getFontSize(20, context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ListView.builder to show patients
              Padding(
                padding: EdgeInsets.only(top: getFontSize(40, context)),
                child: Expanded(
                  child: _patients.isEmpty
                      ? Center(
                          child: Text(
                            "No patients added yet. Add patients to see them here.",
                          ),
                        )
                      : ListView.builder(
                          itemCount: _patients.length,
                          itemBuilder: (context, index) {
                            final patient = _patients[index];
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage: AssetImage(
                                          'assets/images/girl.png'), // Add a default profile image here
                                    ),
                                    SizedBox(width: getFontSize(15, context)),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            patient.name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: getFontSize(16, context),
                                            ),
                                          ),
                                          Text(
                                            "${patient.phoneNumber} . ${patient.location}",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        // Edit Icon Button
                                        Container(
                                          width: getFontSize(33.79, context),
                                          height: getFontSize(33.79, context),
                                          decoration: BoxDecoration(
                                              color: Colors.blue[200],
                                              shape: BoxShape.circle),
                                          child: Center(
                                            child: IconButton(
                                              icon: Icon(Icons.edit,
                                                  color: Colors.blue),
                                              onPressed: () async {
                                                final updatedPatient =
                                                    await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PatientsInformation(
                                                      patient:
                                                          patient, // Pass current patient
                                                    ),
                                                  ),
                                                );
                                                if (updatedPatient != null &&
                                                    updatedPatient is Patient) {
                                                  _editPatient(
                                                      updatedPatient, index);
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: getFontSize(10, context),
                                        ),
                                        // Delete Icon Button
                                        Container(
                                          width: getFontSize(33.79, context),
                                          height: getFontSize(33.79, context),
                                          decoration: BoxDecoration(
                                              color: Colors.red[200],
                                              shape: BoxShape.circle),
                                          child: Center(
                                            child: IconButton(
                                              icon: Icon(Icons.delete,
                                                  color: Colors.red),
                                              onPressed: () {
                                                _deletePatient(index);
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: getFontSize(350, context),
                                  child: Divider(
                                    color: Colors.grey[200],
                                    thickness: 1,
                                    height: getFontSize(20, context),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                ),
              ),

              // Add Patient Button
              GestureDetector(
                onTap: () async {
                  final newPatient = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PatientsInformation(),
                    ),
                  );

                  if (newPatient != null && newPatient is Patient) {
                    _addPatient(newPatient); // Correctly add the new patient
                  }
                },
                child: Container(
                  width: getFontSize(192, context),
                  height: getFontSize(52, context),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle_outline, color: Colors.white),
                      SizedBox(width: getFontSize(10, context)),
                      Text(
                        "Add patient(s)",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getFontSize(16, context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: getFontSize(30, context)),
            ],
          ),
        ),
      ),
    );
  }
}