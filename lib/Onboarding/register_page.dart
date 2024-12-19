import 'package:pharmacy_app/Onboarding/set_password.dart';
import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import '../components/my_blue_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getFontSize(25, context)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: getFontSize(40, context)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFontSize(28, context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getFontSize(30, context)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "First Name",
                      style: TextStyle(
                        fontSize: getFontSize(14, context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getFontSize(10, context)),
                  child: MyTextfield(
                    hinttext: "First Name",
                    obscuretext: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getFontSize(20, context)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Last Name",
                      style: TextStyle(
                        fontSize: getFontSize(14, context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getFontSize(10, context)),
                  child: MyTextfield(
                    hinttext: "Last Name",
                    obscuretext: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getFontSize(20, context)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: getFontSize(14, context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getFontSize(10, context)),
                  child: MyTextfield(
                    hinttext: "Phone Number",
                    obscuretext: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getFontSize(20, context)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontSize: getFontSize(14, context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getFontSize(10, context)),
                  child: MyTextfield(
                    hinttext: "Email Address",
                    obscuretext: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getFontSize(20, context)),
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SetPassword())),
                    child: MyBlueButton(
                      text: "Register",
                    ),
                  ),
                ),
                SizedBox(
                  height: getFontSize(30, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: getFontSize(120, context),
                      child: Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                    ),
                    SizedBox(
                      width: getFontSize(8, context),
                    ),
                    Text(
                      "Or register with",
                    ),
                    SizedBox(
                      width: getFontSize(8, context),
                    ),
                    SizedBox(
                      width: getFontSize(89, context),
                      child: Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: getFontSize(20, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/facebook.png",
                      scale: 4,
                    ),
                    SizedBox(width: getFontSize(10, context)),
                    Image.asset(
                      "assets/images/google.png",
                      scale: 4,
                    ),
                  ],
                ),
                SizedBox(
                  height: getFontSize(30, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(
                      width: getFontSize(4, context),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage())),
                      child: Text(
                        "Login here",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
