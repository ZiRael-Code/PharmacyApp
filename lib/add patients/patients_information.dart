import 'package:pharmacy_app/add%20patients/patients_list_screen.dart';
import 'package:pharmacy_app/components/patients_textfield.dart';
import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/my_blue_button.dart';

class PatientsInformation extends StatefulWidget {
  final Patient? patient;
  PatientsInformation({super.key, this.patient});

  @override
  State<PatientsInformation> createState() => _PatientsInformationState();
}

class _PatientsInformationState extends State<PatientsInformation> {
  late TextEditingController _nameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _locationController;

  @override
  void initState() {
    super.initState();

    // If editing, pre-fill the fields with existing patient data
    _nameController = TextEditingController(text: widget.patient?.name ?? '');
    _phoneNumberController =
        TextEditingController(text: widget.patient?.phoneNumber ?? '');
    _locationController =
        TextEditingController(text: widget.patient?.location ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _savePatient() {
    final String name = _nameController.text.trim();
    final String phoneNumber = _phoneNumberController.text.trim();
    final String location = _locationController.text.trim();

    if (name.isNotEmpty && phoneNumber.isNotEmpty && location.isNotEmpty) {
      final Patient newPatient = Patient(
        name: name,
        phoneNumber: phoneNumber,
        location: location,
      );

      Navigator.pop(context, newPatient); // Return the patient object
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: getFontSize(25, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: getFontSize(40, context)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: getFontSize(35, context),
                        height: getFontSize(35, context),
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
                    SizedBox(width: getFontSize(60, context)),
                    Text(
                      "Patients information",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFontSize(20, context),
                      ),
                    ),
                  ],
                ),
              ),

              // Patient full name
              Padding(
                padding: EdgeInsets.only(top: getFontSize(40, context)),
                child: Text(
                  "Patient full name",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: getFontSize(10, context)),
                child: PatientsTextfield(
                  height: getFontSize(50, context),
                  width: getFontSize(335, context),
                  hinttext: "e.g Janet Okoli",
                  controller: _nameController,
                ),
              ),

              // Patient phone number
              Padding(
                padding: EdgeInsets.only(top: getFontSize(20, context)),
                child: Text(
                  "Patient phone number",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: getFontSize(10, context)),
                child: PatientsTextfield(
                  height: getFontSize(50, context),
                  width: getFontSize(335, context),
                  hinttext: "e.g 08011112233",
                  controller: _phoneNumberController,
                ),
              ),

              // Gender and Age
              Padding(
                padding: EdgeInsets.only(top: getFontSize(20, context)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gender",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: getFontSize(10, context)),
                        PatientsTextfield(
                          height: getFontSize(50, context),
                          width: getFontSize(157, context),
                          hinttext: "e.g Female",
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: getFontSize(30, context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: getFontSize(10, context)),
                          PatientsTextfield(
                            height: getFontSize(50, context),
                            width: getFontSize(157, context),
                            hinttext: "e.g 34",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Blood group and Genotype
              Padding(
                padding: EdgeInsets.only(top: getFontSize(20, context)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Blood group",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: getFontSize(10, context)),
                        PatientsTextfield(
                          height: getFontSize(50, context),
                          width: getFontSize(157, context),
                          hinttext: "O+",
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: getFontSize(30, context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Genotype",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: getFontSize(10, context)),
                          PatientsTextfield(
                            height: getFontSize(50, context),
                            width: getFontSize(157, context),
                            hinttext: "AS",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Location
              Padding(
                padding: EdgeInsets.only(top: getFontSize(20, context)),
                child: Text(
                  "Location",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: getFontSize(10, context)),
              PatientsTextfield(
                height: getFontSize(50, context),
                width: getFontSize(335, context),
                hinttext: "e.g Lagos",
                controller: _locationController,
              ),
              SizedBox(height: getFontSize(20, context)),

              // Medical history
              Text(
                "Medical history",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: getFontSize(10, context)),
              PatientsTextfield(
                height: getFontSize(160, context),
                width: getFontSize(335, context),
                hinttext: "No medical history available yet",
              ),
              SizedBox(height: getFontSize(60, context)),

              // Add Patient Button
              GestureDetector(
                onTap: () {
                  if (_nameController.text.isNotEmpty &&
                      _phoneNumberController.text.isNotEmpty &&
                      _locationController.text.isNotEmpty) {
                    // Create a new patient
                    final newPatient = Patient(
                      name: _nameController.text,
                      phoneNumber: _phoneNumberController.text,
                      location: _locationController.text,
                    );

                    // Navigate to PatientListScreen with the new patient
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientListScreen(
                          initialPatients: [newPatient],
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please fill in all fields"),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: getFontSize(30, context)),
                  child: MyBlueButton(
                      text: widget.patient == null ? "Add Patient" : "Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
