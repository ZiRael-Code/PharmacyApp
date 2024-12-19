import 'package:pharmacy_app/Onboarding/enable_fingerprint.dart';
import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import '../components/my_blue_button.dart';
import '../components/my_textfield.dart';

class SetPassword extends StatefulWidget {
  SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getFontSize(25, context)),
        child: Column(
          children: [
            SizedBox(
              height: getFontSize(60, context),
            ),
            Image.asset(
              "assets/images/setpasswordframe.png",
              scale: 4,
            ),
            SizedBox(
              height: getFontSize(40, context),
            ),
            Text(
              "Set new password",
              style: TextStyle(
                fontSize: getFontSize(28, context),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: getFontSize(30, context),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Type in a new assword",
                style: TextStyle(
                  fontSize: getFontSize(14, context),
                ),
              ),
            ),
            SizedBox(
              height: getFontSize(10, context),
            ),
            MyTextfield(
              hinttext: "******",
              obscuretext: _obscureText,
              suffixicon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
              ),
            ),
            SizedBox(
              height: getFontSize(30, context),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Confirm password",
                style: TextStyle(
                  fontSize: getFontSize(14, context),
                ),
              ),
            ),
            SizedBox(
              height: getFontSize(10, context),
            ),
            MyTextfield(
              hinttext: "******",
              obscuretext: _obscureText,
              suffixicon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
              ),
            ),
            Spacer(),
            GestureDetector(
                onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EnableFingerprint())),
                child: MyBlueButton(text: "Continue")),
            SizedBox(
              height: getFontSize(40, context),
            )
          ],
        ),
      ),
    ));
  }
}
