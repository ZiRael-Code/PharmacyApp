import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Account/Referral/contacts_tile.dart';

class AddExistingPatient extends StatelessWidget {
  final List<String> filteredContacts;

  AddExistingPatient({
    super.key,
    required this.filteredContacts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: filteredContacts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/patients.png"),
                  SizedBox(height: getFontSize(20, context)),
                  Text(
                    "No patients found",
                    style: TextStyle(color: Colors.grey, fontSize: getFontSize(16, context)),
                  ),
                  Text("Click on the search bar to look for patients",
                      style: TextStyle(color: Colors.grey, fontSize: getFontSize(16, context))),
                ],
              ),
            )
          : ListView.builder(
              itemCount: filteredContacts.length,
              itemBuilder: (context, index) {
                final contact = filteredContacts[index];
                return ContactsTile(
                  name: contact,
                  phonenumber: "08028643738", // Example phone number
                  onAddPatient: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                  width: getFontSize(98, context),
                                  height: getFontSize(98, context),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.shade100,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: SvgPicture.asset(
                                        "assets/images/checked.svg"),
                                  )),
                              SizedBox(height: getFontSize(30, context)),
                              SizedBox(
                                width: getFontSize(156, context),
                                height: getFontSize(45, context),
                                child: Text(
                                  'Request sent to $contact',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: getFontSize(16, context),
                                  ),
                                ),
                              ),
                              SizedBox(height: getFontSize(20, context)),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                  },
                                  child: Text(
                                    "Ok, got it",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
    );
  }
}