import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../MainScreen/Dashboard.dart';
import 'all_specialist.dart';

class AdminPanelEditInfo extends StatefulWidget {
  AdminPanelEditInfo({super.key});

  @override
  State<AdminPanelEditInfo> createState() => _AdminPanelEditInfoState();
}

class _AdminPanelEditInfoState extends State<AdminPanelEditInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
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
            Spacer(),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Admin panel',
                style: TextStyle(
                    fontSize: getFontSize(20, context),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      width: getFontSize(0.7, context), color: Colors.black38)),
              child: Stack(
                children: [
                  Positioned(
                    right: getFontSize(0, context),
                    child: SvgPicture.asset("assets/images/bigkey.svg"),
                  ),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.70),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Custom login",
                            style: TextStyle(
                                fontSize: getFontSize(18, context),
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: getFontSize(10, context),
                          ),
                          SizedBox(
                            width: getFontSize(204, context),
                            child: Text(
                                style: TextStyle(color: Colors.black38),
                                "Manage specialists details, their login details and see their work histories on myvitalz."),
                          ),
                          SizedBox(
                            height: getFontSize(10, context),
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                // fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: getFontSize(12.0, context)),
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Edit login info",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: getFontSize(16, context)),
                                      ),
                                      SizedBox(
                                        width: getFontSize(10, context),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                        size: getFontSize(24, context),
                                      ),
                                    ]),
                              ))
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(
              height: getFontSize(15, context),
            ),
            Row(
              children: [
                AutoSizeText(
                  "All specialist",
                  style: TextStyle(
                    fontSize: getFontSize(19, context),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllSpecialist()));
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                    },
                    child: AutoSizeText('See all',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: getFontSize(16.0, context),
                        )))
              ],
            ),
            SizedBox(
              height: getFontSize(15, context),
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(children: [
              request_tile(
                  name: "Olorunsogo Janet",
                  profile_path: "assets/images/doc.png",
                  type: "Psychologist"),
              request_tile(
                  name: "Salami Kelvin",
                  profile_path: "assets/images/doc.png",
                  type: "Psychologist"),
              request_tile(
                  name: "Olorunsogo Janet",
                  profile_path: "assets/images/doc.png",
                  type: "Psychologist"),
              request_tile(
                  name: "Salami Kelvin",
                  profile_path: "assets/images/doc.png",
                  type: "Psychologist"),
            ])))
          ],
        ),
      ),
    );
  }

  request_tile(
      {required String name,
      required profile_path, // Pass the profile path
      required String type}) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: getFontSize(5, context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: getFontSize(55, context),
                  height: getFontSize(55, context),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(profile_path),
                  )),
              SizedBox(
                width: getFontSize(10, context),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: getFontSize(18, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getFontSize(5, context),
                  ),
                  SizedBox(height: getFontSize(2, context)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Requesting to be a patient",
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.more_vert_outlined)
            ],
          ),
          SizedBox(height: getFontSize(5, context)),
          SizedBox(
            width: getFontSize(350, context),
            child: Divider(
              color: Colors.grey[300],
            ),
          )
        ],
      ),
    );
  }
}
