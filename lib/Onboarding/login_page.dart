import 'package:pharmacy_app/Onboarding/register_page.dart';
import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import '../MainScreen/MainNavigator.dart';
import '../components/my_blue_button.dart';
import '../components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getFontSize(25, context)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: getFontSize(60, context)),
                  child: Center(
                    child: Image.asset(
                      "assets/images/illustration.png",
                      scale: 4,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getFontSize(25, context)),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Welcome",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getFontSize(28, context),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: getFontSize(20, context)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Username",
                            style: TextStyle(
                              fontSize: getFontSize(14, context),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: getFontSize(20, context)),
                        child: MyTextfield(
                          hinttext: "Username",
                          obscuretext: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: getFontSize(15, context)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Password",
                            style: TextStyle(
                              fontSize: getFontSize(14, context),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: getFontSize(15, context)),
                        child: MyTextfield(
                          hinttext: "Password",
                          obscuretext: _obscureText,
                          suffixicon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: getFontSize(15, context)),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot passowrd",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: getFontSize(14, context),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: getFontSize(30, context)),
                        child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainNavigator(
                                          index: 0,
                                        ))),
                            child: MyBlueButton(text: "Login")),
                      ),
                      SizedBox(
                        height: getFontSize(20, context),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: getFontSize(20, context)),
                        child: Center(
                          child: Text("Or login with"),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center within the row
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
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getFontSize(30, context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account yet?"),
                      SizedBox(
                        width: getFontSize(4, context),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage())),
                        child: Text(
                          "Register here",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
