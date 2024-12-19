import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy_app/dynamic_success.dart';
import '../MainScreen/Dashboard.dart';
import 'admin_panel_editInfo.dart';

class SetupLogin extends StatefulWidget {
  SetupLogin({super.key});

  @override
  State<SetupLogin> createState() => _SetupLoginState();
}

class _SetupLoginState extends State<SetupLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                child: SvgPicture.asset(
                  'assets/images/back.svg',
                  width: getFontSize(8.0, context),
                  height: getFontSize(15, context),
                ),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Setup custom login',
                  style: TextStyle(
                    fontSize: getFontSize(20, context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                SizedBox(
                  height: getFontSize(15, context),
                ),
                Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: getFontSize(16, context),
                    ),
                    "You can create unique logins using custom emails you normally use at your hospital so your specialists can login using the same email and password."),
                SizedBox(
                  height: getFontSize(45, context),
                ),
                textField(
                    label: "Enter email extension",
                    hint: "e.g usermail@hospitalmail.com"),
                textField(
                    label: "Set default password",
                    hint: "e.g testpassword1234"),
                textField(
                    label: "Confirm password", hint: "e.g testpassword1234"),
                Spacer(),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DynamicSuccess(
                                text:
                                    "You have successfully setup custom logins for your specialists. You can edit this anytime and set different passwords for different individuals.",
                                buttonText: "done",
                                dart_name: AdminPanelEditInfo(),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          // fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: getFontSize(12.0, context),
                              horizontal: getFontSize(12.0, context)),
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: getFontSize(16, context)),
                          ),
                        )))
              ],
            )));
  }

  textField({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: getFontSize(16, context),
          ),
        ),
        SizedBox(height: getFontSize(8.0, context)),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Color(0xFFf0f0f0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: getFontSize(18.0, context)),
      ],
    );
  }
}
