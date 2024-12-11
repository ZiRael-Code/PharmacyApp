import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'add_existing_patient.dart';
import 'invite_through_link.dart';


class AddAPatient extends StatefulWidget {
  AddAPatient({super.key});

  @override
  State<AddAPatient> createState() => _AddAPatientState();
}

class _AddAPatientState extends State<AddAPatient>
    with TickerProviderStateMixin {
  late TabController _tabController;

  // Define the initial contacts list with ContactsTile objects
  List<String> contacts = [
    "Alexander Trelawney",
    "Blexander Trelawney",
    "Jonathan Mason",
    "Sophia Bennett",
    "Emily Jones",
  ]; // Example contacts

  // Filtered contacts initially set to full contacts list
  List<String> filteredContacts = [
    "Alexander Trelawney",
    "Blexander Trelawney",
    "Jonathan Mason",
    "Sophia Bennett",
  ];

  // Filter contacts based on search query
  void _filterContacts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredContacts =
            contacts; // Reset to show all contacts if search is empty
      } else {
        filteredContacts = contacts
            .where((contact) =>
                contact.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Update the UI when the tab changes
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 35,
                      height: 35,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFFE5E5E5),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/back.svg',
                        width: 8.0,
                        height: 15,
                      ),
                    ),
                  ),
                  SizedBox(width: 70),
                  Center(
                    child: Text(
                      "Add a patient",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 35),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(4),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelColor: Colors.black,
                        unselectedLabelColor: Color(0xff4F4F4F),
                        tabs: [
                          Tab(text: "Add existing patient"),
                          Tab(text: "Invite through link"),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    // Only show the search bar for the first tab
                    if (_tabController.index == 0)
                      Container(
                        height: 50,
                        padding: EdgeInsets.all(4),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextField(
                          onChanged: _filterContacts,
                          decoration: InputDecoration(
                            hintText: "Patient name or Phone number",
                            hintStyle: TextStyle(
                                fontSize: 14, color: Colors.grey[400]),
                            prefixIcon: Icon(Icons.search),
                            prefixIconColor: Colors.grey[400],
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    SizedBox(height: 10),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Center(
                              child: AddExistingPatient(
                                  filteredContacts: filteredContacts)),
                          Center(child: InviteThroughLink()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
