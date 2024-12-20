import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy_app/add%20patients/add_patients.dart';

import '../MainScreen/Dashboard.dart';

class SetupNetworkMain extends StatelessWidget {
  const SetupNetworkMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
             Padding(
              padding: EdgeInsets.only(top: getFontSize(120, context)),
              child: Center(
                child: Text(
                  "Setup Network",
                  style: TextStyle(fontSize: getFontSize(28, context), fontWeight: FontWeight.w500),
                ),
              ),
            ),
             SizedBox(
              height: getFontSize(20, context),
            ),
            Container(
              width: getFontSize(257, context),
              height: getFontSize(47, context),
              child: Text(
                textAlign: TextAlign.center,
                "Setup your network and add patients, specialists and hospitals.",
                style: TextStyle(fontSize: getFontSize(14, context), color: Colors.grey),
              ),
            ),
             SizedBox(
              height: getFontSize(40, context),
            ),
            SvgPicture.asset("assets/images/network.svg"),
             SizedBox(
              height: getFontSize(80, context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: getFontSize(90, context),
                    height: getFontSize(118, context),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddPatients())),
                          child: Container(
                            width: getFontSize(78, context),
                            height: getFontSize(78, context),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blue[50]),
                            child: Center(
                                child: SvgPicture.asset(
                                    "assets/images/person.svg")),
                          ),
                        ),
                         SizedBox(
                          height: getFontSize(20, context),
                        ),
                         Text(
                          "Add patients",
                          style: TextStyle(fontSize: getFontSize(12, context)),
                        )
                      ],
                    ),
                  ),

                  // physicans
                  Container(
                    width: getFontSize(90, context),
                    height: getFontSize(118, context),
                    child: Column(
                      children: [
                        Container(
                          width: getFontSize(78, context),
                          height: getFontSize(78, context),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue[50]),
                          child: Center(
                              child:
                                  SvgPicture.asset("assets/images/doctor.svg")),
                        ),
                         SizedBox(
                          height: getFontSize(20, context),
                        ),
                         Text(
                          "Add specialists",
                          style: TextStyle(fontSize: getFontSize(12, context)),
                        )
                      ],
                    ),
                  ),

                  // pharmacy
                  Container(
                    width: getFontSize(90, context),
                    height: getFontSize(118, context),
                    child: Column(
                      children: [
                        Container(
                          width: getFontSize(78, context),
                          height: getFontSize(78, context),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue[50]),
                          child: Center(
                              child: SvgPicture.asset("assets/images/rx.svg")),
                        ),
                        SizedBox(
                          height: getFontSize(20, context),
                        ),
                        Text(
                          "Add pharmacy",
                          style: TextStyle(fontSize: getFontSize(12, context)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getFontSize(40, context),
            ),
            Container(
              width: getFontSize(335, context),
              height: getFontSize(54, context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                  border: Border.all(color: Colors.blue)),
              child: Center(
                  child: Text(
                "I'll do this later",
                style: TextStyle(color: Colors.blue),
              )),
            )
          ],
        ),
      )),
    );
  }
}
