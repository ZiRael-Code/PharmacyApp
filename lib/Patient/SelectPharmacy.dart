import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'PrescribeDrugsAddDrug.dart';

void main(){
  runApp(SelectPharmacy());
}

class SelectPharmacy extends StatefulWidget {
  SelectPharmacy({super.key});
  @override
  _AppointmentPaymentScreen createState() => _AppointmentPaymentScreen();
}

class _AppointmentPaymentScreen extends  State<SelectPharmacy> {
  String? _selectedValue;
  bool isFilterOpen = false;
  List<String> btnText = ["Pharmacy", "Hospital", "Doctor", "Gynaecologist", "Dentist", "Surgeon", "Surgeon", "Opthalmologist", "Others..."];
  bool isOther = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5),
                ),
                child: SvgPicture.asset('assets/images/back.svg',
                  width: 8.0,
                  height: 15,),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                child:
                Center(child: Text(
                  'Select pharmacy',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal
                  ),
                ),
                ),
              ),
              Spacer(),
            ],
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
            child: Column(
              children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    // Search field
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      width: MediaQuery.of(context).size.width * 0.70,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search by name, location',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),

                    // Filter icon
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFilterOpen = !isFilterOpen; // Toggle the dropdown and icon
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 12),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: isFilterOpen
                            ? Icon(Icons.close, color: Colors.black) // X icon when open
                            : SvgPicture.asset('assets/images/filter.svg'), // Filter icon when closed
                      ),
                    ),
                  ],
                ),

                // Filter dropdown appears under the row when isFilterOpen is true

                if (isFilterOpen)
                  Container(
                    margin: EdgeInsets.only(top: 16), // Spacing between row and dropdown
                    width: double.infinity, // Matches screen width
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Filters",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 20), // Space between the text and buttons
                        Wrap(
                          spacing: 5, // Space between buttons horizontally
                          runSpacing: 8, // Space between buttons vertically
                          children: [
                            for (int i = 0; i <= btnText.length-1; i++) // Create 9 buttons
                              ElevatedButton(
                                onPressed: () {
                                  // Button logic here
                                },
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                    color: i == btnText.length-1 ? Colors.blue : Colors.transparent, // Border color
                                    width:  i == btnText.length-1 ? 1.0 : 0.0, // Border width
                                  ),
                                  shadowColor: Colors.transparent,
                                  backgroundColor: i == btnText.length-1 ? Colors.transparent : Color(0xFFE2EDFF)  , // Button color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50), // Rounded corners
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Text(
                                    btnText[i],
                                    style: TextStyle(color: Color(0xff3C8AFF), fontSize: 11.5), // Button text color
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 40),

                // List of specialists
                specialist(
                  image: "assets/images/doc.png",
                  name: "Walls and Gates Rx",
                  specialization: "Design Doctor",
                  workingType: "Surulere, Lagos",
                ),
                specialist(
                  image: "assets/images/doc1.png",
                  name: "Walls and Gates Rx",
                  specialization: "Surulere, Lagos",
                  workingType: "",
                ),
                specialist(
                  image: "assets/images/host2.png",
                  name: "Walls and Gates Rx",
                  specialization: "Surulere, Lagos",
                  workingType: "",
                ),
                specialist(
                  image: "assets/images/pharm2.jpeg",
                  name: "Walls and Gates Rx",
                  specialization: "Surulere, Lagos",
                  workingType: "",
                ),
                specialist(
                  image: "assets/images/host2.png",
                  name: "Walls and Gates Rx",
                  specialization: "Surulere, Lagos",
                  workingType: "",
                ),
                specialist(
                  image: "assets/images/pharm2.jpeg",
                  name: "Walls and Gates Rx",
                  specialization: "Surulere, Lagos",
                  workingType: "",
                ),
              ],
            ),
          ),
        ),
    );
  }

  specialist({
    required String image,
    required String name,
    required String specialization,
    required String workingType,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PrescribeDrugsAddDrugs()));
      },
        child: Container(
      child: Column(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 44,
                  width: 44,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(image),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "$specialization . $workingType",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.withOpacity(0.90),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: 15),
        ],
      ),
      ),
    );
  }
}