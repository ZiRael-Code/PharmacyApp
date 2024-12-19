import 'package:pharmacy_app/Patient/invite_through_link.dart';
import 'package:pharmacy_app/add%20patients/upload_file.dart';
import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddAPatient extends StatefulWidget {
  AddAPatient({super.key});

  @override
  State<AddAPatient> createState() => _AddAPatientState();
}

class _AddAPatientState extends State<AddAPatient>
    with TickerProviderStateMixin {
  late TabController _tabController;

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
                    Padding(
                      padding: EdgeInsets.only(top: getFontSize(70, context)),
                      child: Center(
                        child: Text(
                          "Add a patient",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getFontSize(20, context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: getFontSize(10, context)),
                child: Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: getFontSize(36, context)),
                        child: Container(
                          height: getFontSize(50, context),
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
                              Tab(text: "Upload file"),
                              Tab(text: "Send invite link"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: getFontSize(10, context)),
                        child: Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Center(child: UploadFile()),
                              Center(child: InviteThroughLink()),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
