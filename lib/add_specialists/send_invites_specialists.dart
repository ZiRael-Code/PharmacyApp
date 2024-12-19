import 'package:pharmacy_app/add_specialists/send_invites_success_specialists.dart';
import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/my_blue_button.dart';

class SendInvitesSpecialists extends StatefulWidget {
  final List<String> selectedContacts;
  SendInvitesSpecialists({super.key, required this.selectedContacts});

  @override
  State<SendInvitesSpecialists> createState() => _SendInvitesSpecialistsState();
}

class _SendInvitesSpecialistsState extends State<SendInvitesSpecialists> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getFontSize(25, context)),
          child: Column(
            children: [
              SizedBox(height: getFontSize(30, context)),
              Row(
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
                  SizedBox(width: getFontSize(50, context)),
                  Center(
                    child: Text(
                      "Select from contact list",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFontSize(20, context),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getFontSize(40, context)),
              SizedBox(
                width: getFontSize(310, context),
                height: getFontSize(190, context),
                child: Column(
                  children: [
                    Text(
                      "Send an invite link to a patient, so when the person registers on the app using your link, you will be able to access their details.",
                      style: TextStyle(fontSize: getFontSize(14, context)),
                    ),
                    SizedBox(height: getFontSize(20, context)),
                    Text(
                      "To download the MyVitalz app, click on this link to download from playstore or app store.",
                      style: TextStyle(fontSize: getFontSize(14, context)),
                    ),
                    SizedBox(height: getFontSize(20, context)),
                    Row(
                      children: [
                        Text(
                          "Link: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "7f4j6n8qN6EDCP-9wd/8ag7...",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: getFontSize(14, context)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: getFontSize(30, context)),
              SizedBox(height: getFontSize(5, context)),
              SizedBox(
                width: getFontSize(350, context),
                child: Divider(
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(height: getFontSize(20, context)),
              // Display the count of selected contacts
              Center(
                child: Text(
                  "${widget.selectedContacts.length} Contacts selected ",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: getFontSize(16, context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: getFontSize(20, context)),
              // Display selected contacts in a horizontal scroll view
              SizedBox(
                height: getFontSize(100, context),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.selectedContacts.length,
                  itemBuilder: (context, index) {
                    final contact = widget.selectedContacts[index];
                    return Padding(
                      padding: EdgeInsets.only(right: getFontSize(10, context)),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              // Circle with initials
                              Container(
                                width: getFontSize(60, context),
                                height: getFontSize(60, context),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child: Center(
                                  child: Text(
                                    contact[
                                        0], // First letter of contact's name
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: getFontSize(20, context),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              // Close icon for removing contact
                              Positioned(
                                top: getFontSize(0, context),
                                right: getFontSize(0, context),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.selectedContacts.removeAt(index);
                                    });
                                  },
                                  child: Container(
                                    width: getFontSize(20, context),
                                    height: getFontSize(20, context),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: getFontSize(16, context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: getFontSize(5, context)),
                          // Contact name
                          SizedBox(
                            width: getFontSize(70, context),
                            child: Text(
                              contact,
                              style:
                                  TextStyle(fontSize: getFontSize(12, context)),
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: getFontSize(20, context),
              ),
              SizedBox(
                width: getFontSize(350, context),
                child: Divider(
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(
                height: getFontSize(5, context),
              ),
              Center(
                child: Image.asset(
                  "assets/images/Rectangle.png",
                ),
              ),
              SizedBox(
                height: getFontSize(20, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: getFontSize(90, context),
                        height: getFontSize(90, context),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue[100]),
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: SvgPicture.asset(
                            "assets/images/whatsapps.svg",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getFontSize(20, context),
                      ),
                      SizedBox(
                        width: getFontSize(90, context),
                        child: Text(
                          "Share on whatsapp",
                          style: TextStyle(fontSize: getFontSize(12, context)),
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: getFontSize(50, context),
                  ),
                  Column(
                    children: [
                      Container(
                        width: getFontSize(90, context),
                        height: getFontSize(90, context),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue[100]),
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: SvgPicture.asset(
                            "assets/images/messangers.svg",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getFontSize(20, context),
                      ),
                      SizedBox(
                        width: getFontSize(90, context),
                        child: Text(
                          "Share as text message",
                          style: TextStyle(fontSize: getFontSize(12, context)),
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: getFontSize(20, context),
              ),
              GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SendInvitesSuccessSpecialists())),
                  child: MyBlueButton(text: "Send invites"))
            ],
          ),
        ),
      ),
    );
  }
}
