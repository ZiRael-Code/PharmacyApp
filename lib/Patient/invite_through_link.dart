import 'package:flutter/material.dart';
import 'package:pharmacy_app/Patient/select_from_contact_list.dart';

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
              width: 305,
              child: Column(
                children: [
                  Text(
                    "Send an invite link to a patient, so when the person registers on the app using your link, you will be able to access their details.",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "To download the MyVitalz app, click on this link to download from playstore or app store.",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text("Link: "),
                    Text(
                      "7f4j6n8qN6EDCP-9wd/8ag7...",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                    width: 79,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 14,
                          height: 14,
                          child: Image.asset(
                            "assets/images/Union.png",
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Copy")
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
        InkWell(
          onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> SelectFromContactList())),
          child:
            Center(
              child: Container(
                width: 220,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(child: Text("Select from contact list")),
              ),
            )
            )
          ],
        ),
      ),
    );
  }
}
