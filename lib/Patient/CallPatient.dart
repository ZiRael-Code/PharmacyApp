import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';

class CallingUi extends StatefulWidget {
  CallingUi({super.key});

  @override
  State<CallingUi> createState() => _CallingUiState();
}

class _CallingUiState extends State<CallingUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(16),
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
            Text('Dr. Nelson Yang', style: TextStyle(fontSize: getFontSize(16, context)),)
            ,Text('Calling', style: TextStyle(fontSize: getFontSize(16, context), color: Colors.black26),)

            ,Spacer(),
            Padding(padding: EdgeInsets.only(left: getFontSize(35, context), right: getFontSize(35, context)),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                callAction(
                  icon: Icons.volume_up,
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
                callAction(
                  icon: Icons.mic
                ),
              ],
            ),
            ),
            SizedBox(height: getFontSize(50, context),),
          ],
        )
        )
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
      child: Icon(icon, color: Colors.blue,),
    );
  }
}