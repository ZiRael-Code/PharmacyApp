import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import '../components/my_blue_button.dart';
import '../components/my_selected.dart';

class SetAppointmentTimes2 extends StatelessWidget {
  SetAppointmentTimes2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              SizedBox(
                height: getFontSize(40, context),
              ),
              Row(
                children: [
                  Container(
                    height: getFontSize(45, context),
                    width: getFontSize(45, context),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300, shape: BoxShape.circle),
                    child: Icon(Icons.arrow_back),
                  ),
                  SizedBox(
                    width: getFontSize(110, context),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/frames.png",
                      width: getFontSize(65, context),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getFontSize(40, context),
              ),
              Column(
                children: [
                  Text(
                    "Set appointment",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getFontSize(28, context),
                    ),
                  ),
                  Text(
                    "times",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getFontSize(28, context),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getFontSize(30, context),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Specialzation",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: getFontSize(14, context)),
                    ),
                  ),
                  SizedBox(
                    height: getFontSize(10, context),
                  ),
                  Container(
                    height: getFontSize(50, context),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: getFontSize(10, context)),
                          child: Text(
                            "e.g cardiologist",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_drop_down),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: getFontSize(15, context),
              ),

              // add available times
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add available times",
                      style:
                          TextStyle(fontSize: getFontSize(16, context), fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: getFontSize(15, context),
                    ),
                    Row(
                      children: [
                        MySelected(
                          text: "+ Add time",
                          isSelected: false,
                          height: getFontSize(38, context),
                          width: getFontSize(88, context),
                        ),
                        SizedBox(
                          width: getFontSize(15, context),
                        ),
                        MySelected(
                          text: "11:00AM - 3:00AM",
                          isSelected: false,
                          height: getFontSize(38, context),
                          width: getFontSize(138, context),
                        ),
                        SizedBox(
                          width: getFontSize(15, context),
                        ),
                        MySelected(
                          text: "12:30AM",
                          isSelected: false,
                          height: getFontSize(38, context),
                          width: getFontSize(88, context),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getFontSize(20, context),
                    ),
                    Text(
                      "Add available times",
                      style:
                          TextStyle(fontSize: getFontSize(16, context), fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: getFontSize(15, context),
                    ),
                    Wrap(
                      runSpacing: 10.0,
                      children: [
                        MySelected(
                          text: "+ Add days",
                          isSelected: false,
                          height: getFontSize(38, context),
                          width: getFontSize(88, context),
                        ),
                        SizedBox(
                          width: getFontSize(15, context),
                        ),
                        MySelected(
                          text: "MON",
                          isSelected: false,
                          height: getFontSize(38, context),
                          width: getFontSize(88, context),
                        ),
                        SizedBox(
                          width: getFontSize(15, context),
                        ),
                        MySelected(
                          text: "WED",
                          isSelected: false,
                          height: getFontSize(38, context),
                          width: getFontSize(88, context),
                        ),
                        SizedBox(
                          width: getFontSize(15, context),
                        ),
                        MySelected(
                          text: "THR",
                          isSelected: false,
                          height: getFontSize(38, context),
                          width: getFontSize(88, context),
                        ),
                        SizedBox(
                          width: getFontSize(15, context),
                        ),
                        MySelected(
                          text: "FRI",
                          isSelected: false,
                          height: getFontSize(38, context),
                          width: getFontSize(88, context),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Spacer(),
              MyBlueButton(text: "Continue"),
              SizedBox(
                height: getFontSize(30, context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}