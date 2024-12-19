import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy_app/Onboarding/login_page.dart';
import 'package:pharmacy_app/Specialist/specialist_information.dart';
import '../MainScreen/Dashboard.dart';

class AllSpecialist extends StatefulWidget {
  AllSpecialist({super.key});

  @override
  State<AllSpecialist> createState() => _AllSpecialistState();
}

class _AllSpecialistState extends State<AllSpecialist> {
  bool isFilterOpen = false;
  List<String> btnText = [
    "Pharmacy",
    "Hospital",
    "Doctor",
    "Gynaecologist",
    "Dentist",
    "Surgeon",
    "Surgeon",
    "Opthalmologist",
    "Others..."
  ];
  bool isOther = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: InkWell(
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
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    'All specialists',
                    style: TextStyle(
                        fontSize: getFontSize(20, context),
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.only(
                bottom: getFontSize(30, context),
                left: getFontSize(15, context),
                right: getFontSize(15, context)),
            child: Column(children: [
              SizedBox(height: getFontSize(30, context)),
              Row(
                children: [
                  // Search field
                  Container(
                    padding: EdgeInsets.only(right: getFontSize(10, context)),
                    width: MediaQuery.of(context).size.width * 0.70,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by name, vital reading..',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: getFontSize(15, context)),
                      ),
                    ),
                  ),

                  // Filter icon
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFilterOpen =
                            !isFilterOpen; // Toggle the dropdown and icon
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: getFontSize(12, context)),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: isFilterOpen
                          ? Icon(Icons.close,
                              color: Colors.black) // X icon when open
                          : SvgPicture.asset(
                              'assets/images/filter.svg'), // Filter icon when closed
                    ),
                  ),
                ],
              ),

              // Filter dropdown appears under the row when isFilterOpen is true

              if (isFilterOpen)
                Container(
                  margin: EdgeInsets.only(
                      top: getFontSize(
                          16, context)), // Spacing between row and dropdown
                  width: double.infinity, // Matches screen width
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Filters",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: getFontSize(18, context),
                        ),
                      ),
                      SizedBox(
                          height: getFontSize(20,
                              context)), // Space between the text and buttons
                      Wrap(
                        spacing: 5, // Space between buttons horizontally
                        runSpacing: 8, // Space between buttons vertically
                        children: [
                          for (int i = 0;
                              i <= btnText.length - 1;
                              i++) // Create 9 buttons
                            ElevatedButton(
                              onPressed: () {
                                // Button logic here
                              },
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                  color: i == btnText.length - 1
                                      ? Colors.blue
                                      : Colors.transparent, // Border color
                                  width: i == btnText.length - 1
                                      ? 1.0
                                      : 0.0, // Border width
                                ),
                                shadowColor: Colors.transparent,
                                backgroundColor: i == btnText.length - 1
                                    ? Colors.transparent
                                    : Color(0xFFE2EDFF), // Button color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      50), // Rounded corners
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  btnText[i],
                                  style: TextStyle(
                                      color: Color(0xff3C8AFF),
                                      fontSize: getFontSize(
                                          11.5, context)), // Button text color
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              SizedBox(height: getFontSize(40, context)),
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
            ])));
  }

  request_tile(
      {required String name, required profile_path, required String type}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (builder) => LoginPage()));
      },
      child: Container(
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
      ),
    );
  }
}
