import 'package:pharmacy_app/add%20pharmacy/select_from_contact_list_pharmacy.dart';

import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';

class InviteThroughLink extends StatefulWidget {
  InviteThroughLink({super.key});

  @override
  State<InviteThroughLink> createState() => _InviteThroughLinkState();
}

class _InviteThroughLinkState extends State<InviteThroughLink> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              width: getFontSize(305, context),
              child: Column(
                children: [
                  Text(
                    "Send an invite link to your in house or affiliated external pharmacy (if any) so when he registers on the app using your link, you will be able to access his drugs and send prescriptions to him. If he is already on the platform, he will only need to accept you as a referring physician. ",
                    style: TextStyle(
                      fontSize: getFontSize(14, context),
                    ),
                  ),
                  SizedBox(
                    height: getFontSize(30, context),
                  ),
                  Text(
                    "To download the MyVitalz app, click on this link to download from playstore or app store.",
                    style: TextStyle(
                      fontSize: getFontSize(14, context),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getFontSize(30, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: getFontSize(30, context),
                    ),
                    Text("Link: "),
                    Text(
                      "7f4j6n8qN6EDCP-9wd/8ag7...",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: getFontSize(10, context)),
                  child: Container(
                    width: getFontSize(79, context),
                    height: getFontSize(28, context),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: getFontSize(10, context),
                        ),
                        SizedBox(
                          width: getFontSize(14, context),
                          height: getFontSize(14, context),
                          child: Image.asset(
                            "assets/images/Union.png",
                          ),
                        ),
                        SizedBox(
                          width: getFontSize(8, context),
                        ),
                        Text("Copy")
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: getFontSize(40, context),
            ),
            Center(
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectFromContactListPharmacy())),
                child: Container(
                  width: getFontSize(220, context),
                  height: getFontSize(44, context),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(child: Text("Select from contact list")),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
