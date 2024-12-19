import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'CallPatient.dart';
import 'VideoCalling.dart';

class Chat extends StatefulWidget {
  Chat({super.key});
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends  State<Chat> {
  String? _selectedValue;

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
                    child: SvgPicture.asset('assets/images/back.svg',
                      width: getFontSize(8.0, context),
                      height: getFontSize(15, context),),
                  ),
                  SizedBox(width: getFontSize(25, context),),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                    Column(children: [
                      Text('Dr. Nelson Yang', style: TextStyle(fontSize: getFontSize(18, context)),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child:
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF218130)
                              ),
                              width: getFontSize(11, context),
                              height: getFontSize(11, context),
                            ),
                          ),

                          SizedBox(width: getFontSize(7, context),),
                          Text(
                              'Active now',
                              style: TextStyle(
                                color: Color(0xff2E2E42),
                                fontSize: getFontSize(16, context),
                              ))],
                      ),
                    ],),),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      print("lol works ");
                      showCallMenuBottomSheet(context);
                    },
                    child:
                  Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color: Color(0xffE2EDFF),
                        shape: BoxShape.circle
                    ),
                    child: Icon(Icons.call, color: Colors.blue,),
                  ),
                  ),
                  SizedBox(width: getFontSize(12, context),),
                  Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color: Color(0xffE2EDFF),
                        shape: BoxShape.circle
                    ),
                    child: Icon(Icons.more_horiz_rounded, color: Colors.blue,),
                  )
                ],
              ),
              centerTitle: true,
            ),
            body:

            Container(
              padding: EdgeInsets.only(left: getFontSize(15, context), right: getFontSize(15, context), top: getFontSize(25, context), bottom: getFontSize(25, context)),
              child:
              Column(
                children: [
                  SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Expanded(
                        child:
                        Column(
                            children: [
                              SizedBox(height: getFontSize(20, context)),
                              Text("Wed 8:21 AM"),
                              SizedBox(height: getFontSize(70, context)),

                              incomingMessage(
                                  text: 'Hello, I’m Dr. Nelson! 👋How can I help you?'),
                              outGoingMessage(text: "I am not feeling too well. I woke up with a fever this morning. What should i do?"),

                              incomingMessage(
                                  text: 'Oh, I see. Sorry about that. Please click on the blue icon at the bottom right of your screen to select your symptoms.'),
                              outGoingMessage(text: "Okay"),

                              incomingMessage(
                                  text: 'Use these medications'),

                              Align(
                                alignment: Alignment.centerLeft,
                                child:
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Color(0x331BD939).withOpacity(0.080),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Color(0x4D218130).withOpacity(0.070),
                                      width: getFontSize(2, context), // Border width
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset('assets/images/pill1.svg'),
                                      SizedBox(width: getFontSize(8, context)),
                                      // Text content
                                      Text(
                                        '12/06/2022 - ',
                                        style: TextStyle(
                                          color: Color(0xff218130),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Prescriptions',
                                        style: TextStyle(
                                          color: Color(0xff218130),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Spacer(),
                            ]),
                      )
                  ),
                  Spacer(),

                  Row(

                    children: [
                      // TextField
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Type a message...',
                            contentPadding: EdgeInsets.symmetric(vertical: getFontSize(15, context), horizontal: getFontSize(20, context)),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: Color(0x66BFBFBF),
                                width: getFontSize(0.5, context),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: Color(0x66BFBFBF),
                                width: getFontSize(0.5, context),
                              ),
                            ),
                            suffixIcon: SizedBox(
                              width: getFontSize(96, context),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.attach_file, color: Colors.grey),
                                    onPressed: () {
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.mic, color: Colors.grey),
                                    onPressed: () {
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: getFontSize(10, context)),

                      Container(
                        width: getFontSize(51, context),
                        height: getFontSize(51, context),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),

                ],
              ),


            ));


  }
  incomingMessage({
    required String text,
  }) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 260,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F4F5),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: getFontSize(14, context),
                      ),
                      softWrap: true, // Ensure the text wraps when needed
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getFontSize(20, context)),
        ],
      ),
    );
  }


  outGoingMessage({
    required String text,
  }){
    return Column(children: [
      Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 301,
              ),
              child:
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF3C8AFF),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: getFontSize(14, context),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: getFontSize(20, context),),
    ]
    );
  }

  void showCallMenuBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16), // Rounded top corners for the bottom sheet
        ),
      ),
      builder: (BuildContext sheetContext) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Wrap content to avoid full height
            children: [
              // Title
              Text(
                "Call",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getFontSize(18, context),
                ),
              ),
              SizedBox(height: getFontSize(20, context)),
              // Voice Call and Video Call Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Voice Call Button
                  Container(
                    width: getFontSize(86, context),
                    height: getFontSize(86, context),
                    decoration: BoxDecoration(
                      color: Color(0xffE2EDFF),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.call,
                        color: Colors.blue,
                        size: getFontSize(46, context),
                      ),
                      onPressed: () {
                        // Handle voice call action
                        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> CallingUi())); // Close the bottom sheet
                      },
                    ),
                  ),
                  // Video Call Button
                  Container(
                    width: getFontSize(86, context),
                    height: getFontSize(86, context),
                    decoration: BoxDecoration(
                      color: Color(0xffE2EDFF),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.video_call,
                        color: Colors.blue,
                        size: getFontSize(46, context),
                      ),
                      onPressed: () {
                        // Handle video call action
                        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> VideoCalling())); // Close the bottom sheet// Close the bottom sheet
                      },
                    ),
                  ),
                ],
              ),
              // Cancel Button

            ],
          ),
        );
      },
    );
  }




}