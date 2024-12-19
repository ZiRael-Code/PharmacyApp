import 'package:pharmacy_app/add%20pharmacy/success_pharmacy.dart';

import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmFileUploadPharmacy extends StatefulWidget {
  ConfirmFileUploadPharmacy({super.key});

  @override
  State<ConfirmFileUploadPharmacy> createState() =>
      _ConfirmFileUploadPharmacyState();
}

class _ConfirmFileUploadPharmacyState extends State<ConfirmFileUploadPharmacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getFontSize(15, context)),
          child: Column(
            children: [
              SizedBox(height: getFontSize(40, context)),
              Row(
                children: [
                  Row(
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
                      SizedBox(width: getFontSize(110, context)),
                      SvgPicture.asset("assets/images/second.svg")
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: getFontSize(20, context),
              ),
              Center(
                child: Text(
                  "Confirm file upload",
                  style: TextStyle(
                      fontSize: getFontSize(28, context),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: getFontSize(20, context),
              ),
              Center(
                child: Container(
                  width: getFontSize(256, context),
                  height: getFontSize(47, context),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Confirm that everything you have uploaded is correct.",
                    style: TextStyle(
                        fontSize: getFontSize(14, context), color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: getFontSize(20, context),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Horizontal scrolling
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.grey.shade300), // Table border
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DataTable(
                    headingRowColor: MaterialStateProperty.all(
                        Colors.grey.shade200), // Header color
                    dividerThickness: 1, // Divider between rows
                    columnSpacing: 16.0, // Space between columns
                    columns: [
                      DataColumn(
                        label: SizedBox(
                          width: getFontSize(200, context), // Wider Name column
                          child: Text(
                            'Name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: SizedBox(
                          width:
                              getFontSize(120, context), // Phone number column
                          child: Text(
                            'Phone number',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: SizedBox(
                          width: getFontSize(120, context), // Location column
                          child: Text(
                            'Location',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('Ngozi William')),
                        DataCell(Text('08123456789')),
                        DataCell(Text('Lagos')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Oluwatosin Adebayo')),
                        DataCell(Text('08123456789')),
                        DataCell(Text('Ibadan')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Ngozi William')),
                        DataCell(Text('08123456789')),
                        DataCell(Text('Lagos')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Jonathan Kendall')),
                        DataCell(Text('08123456789')),
                        DataCell(Text('New York')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Ngozi William')),
                        DataCell(Text('08123456789')),
                        DataCell(Text('Abuja')),
                      ]),
                    ],
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SuccessPharmacy())),
                child: Container(
                  width: getFontSize(335, context),
                  height: getFontSize(54, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      border: Border.all(color: Colors.blue.shade50)),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getFontSize(40, context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
