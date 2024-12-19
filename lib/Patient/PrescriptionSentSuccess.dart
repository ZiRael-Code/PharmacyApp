import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import '../MainScreen/MainNavigator.dart';

class Prescriptionsentsuccess extends StatelessWidget {
  Prescriptionsentsuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.only(
                    bottom: getFontSize(26, context),
                    left: getFontSize(16, context),
                    right: getFontSize(16, context),
                    top: getFontSize(10, context)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: getFontSize(80, context)),
                    Text(
                      'Success!',
                      style: TextStyle(
                          fontSize: getFontSize(36, context),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: getFontSize(13, context)),
                    Text(
                      'Prescription has been sent',
                      style: TextStyle(
                        fontSize: getFontSize(14, context),
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (builder) => MainNavigator(
                                    index: 0,
                                  )), // Navigate to Login screen
                          (Route<dynamic> route) =>
                              false, // Remove all previous routes
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize:
                            Size.fromWidth(MediaQuery.of(context).size.width),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getFontSize(12.0, context),
                            horizontal: getFontSize(24.0, context)),
                        child: Text(
                          'Okay',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: getFontSize(18, context)),
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
