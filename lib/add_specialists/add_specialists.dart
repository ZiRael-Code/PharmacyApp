import 'package:pharmacy_app/add_specialists/invite_through_link_specialists.dart';
import 'package:pharmacy_app/add_specialists/upload_file_specailists.dart';
import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddSpecialists extends StatefulWidget {
  AddSpecialists({super.key});

  @override
  State<AddSpecialists> createState() => _AddSpecialistsState();
}

class _AddSpecialistsState extends State<AddSpecialists>
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
                      SvgPicture.asset("assets/images/first.svg")
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: getFontSize(20, context),
              ),
              Center(
                child: Text(
                  "Add specialists",
                  style: TextStyle(
                      fontSize: getFontSize(28, context),
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: getFontSize(25, context)),
                    Container(
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
                          Tab(text: "Upload link"),
                          Tab(text: "Send invite links"),
                        ],
                      ),
                    ),
                    SizedBox(height: getFontSize(10, context)),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Center(child: UploadFileSpecailists()),
                          Center(child: InviteThroughLinkSpecialists()),
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
