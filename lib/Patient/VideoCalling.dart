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
            SizedBox(height: 70,),
            SizedBox(
            width: 108,
            height: 108,
            child:
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/doc.png'),
            )
            ),
            SizedBox(height: 20,),
            Text('Dr. Nelson Yang', style: TextStyle(color: Colors.white ,fontSize: 16),)
            ,Text('Calling', style: TextStyle(fontSize: 16, color: Colors.white),)

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
              width: 62,
              height: 62,
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
      width: 62,
      height: 62,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffE2EDFF),
      ),
      child: Icon(icon, color: Colors.blue, size: 29,),
    );
  }
}
