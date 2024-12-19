import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';

class VideoCalling extends StatefulWidget {
  VideoCalling({super.key});

  @override
  State<VideoCalling> createState() => _VideoCallingState();
}

class _VideoCallingState extends State<VideoCalling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [

            Image.asset('assets/images/doc1.png', width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.cover ,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.50),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SafeArea(
        child:
              Padding(
            padding: EdgeInsets.all(0),
        child: Column(
          children: [
            SizedBox(height: getFontSize(70, context),),
            SizedBox(
            width: getFontSize(108, context),
            height: getFontSize(108, context),
            child:
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/doc.png'),
            )
            ),
            SizedBox(height: getFontSize(20, context),),
            Text('Dr. Nelson Yang', style: TextStyle(color: Colors.white ,fontSize: getFontSize(16, context)),)
            ,Text('Calling', style: TextStyle(fontSize: getFontSize(16, context), color: Colors.white),)

            ,Spacer(),

            Container(
              decoration: BoxDecoration(
                color: Color(0xff2E2E42),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
              ),
              padding: EdgeInsets.all(19),
              child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                callAction(
                  icon: Icons.camera_enhance_sharp,
                ),
                callAction(
                  icon: Icons.videocam_sharp,
                ),
                callAction(
                  icon: Icons.mic_none,
                ),
            Container(
              width: getFontSize(62, context),
              height: getFontSize(62, context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Icon(Icons.phone_missed_outlined, color: Colors.white,),
            ),

              ],
            ),
            ),
          ],
        )
        )

        )
            ]
    )
    );
  }

  callAction({
    required IconData icon})
  {
    return Container(
      width: getFontSize(62, context),
      height: getFontSize(62, context),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffE2EDFF),
      ),
      child: Icon(icon, color: Colors.blue, size: getFontSize(29, context),),
    );
  }
}