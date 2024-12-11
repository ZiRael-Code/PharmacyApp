import 'package:flutter/material.dart';

import '../MainScreen/MainNavigator.dart';

class Prescriptionsentsuccess extends StatelessWidget {
  Prescriptionsentsuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: Padding(padding: EdgeInsets.only(bottom: 26, left: 16, right: 16, top:  10), child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 80),
        Text('Success!', style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),),
        SizedBox(height: 13),
        Text('Prescription has been sent', style: TextStyle(fontSize: 14,),),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (builder) => MainNavigator()), // Navigate to Login screen
                  (Route<dynamic> route) => false, // Remove all previous routes
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'Okay',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    )
    )
    )
    );
  }
}
