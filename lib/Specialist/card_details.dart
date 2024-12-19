import 'package:pharmacy_app/components/my_blue_button.dart';
import 'package:pharmacy_app/components/my_textfield.dart';

import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardDetails extends StatefulWidget {
  CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  bool isToggled = false; // Track toggle state
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getFontSize(20, context)),
        child: Column(
          children: [
            SizedBox(height: getFontSize(40, context)),
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: getFontSize(45, context),
                    height: getFontSize(45, context),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFFE5E5E5),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/back.svg',
                      width: getFontSize(12.0, context),
                      height: getFontSize(12.0, context),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(width: getFontSize(90, context)),
                Text(
                  "Payments",
                  style: TextStyle(
                      fontSize: getFontSize(28, context),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: getFontSize(40, context),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Cardholder full name",
                style: TextStyle(
                    fontSize: getFontSize(14, context),
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: getFontSize(10, context),
            ),
            MyTextfield(hinttext: "Input name on card", obscuretext: false),
            SizedBox(
              height: getFontSize(20, context),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Card number",
                  style: TextStyle(
                      fontSize: getFontSize(14, context),
                      fontWeight: FontWeight.w500),
                )),
            SizedBox(
              height: getFontSize(10, context),
            ),
            MyTextfield(hinttext: "xxxx xxxx xxxx xxxx", obscuretext: false),
            SizedBox(
              height: getFontSize(20, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Expiry date",
                          style: TextStyle(
                              fontSize: getFontSize(14, context),
                              fontWeight: FontWeight.w500),
                        )),
                    SizedBox(
                      height: getFontSize(10, context),
                    ),
                    SizedBox(
                        width: getFontSize(150, context),
                        child:
                            MyTextfield(hinttext: "00/00", obscuretext: false)),
                    SizedBox(
                      height: getFontSize(20, context),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "CVV",
                        style: TextStyle(
                            fontSize: getFontSize(14, context),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: getFontSize(10, context),
                    ),
                    SizedBox(
                        width: getFontSize(150, context),
                        child:
                            MyTextfield(hinttext: "0000", obscuretext: false)),
                    SizedBox(
                      height: getFontSize(20, context),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Save this card for future payments",
                  style: TextStyle(fontSize: getFontSize(14, context)),
                ),
                Switch(
                  value: isToggled,
                  onChanged: (value) {
                    setState(() {
                      isToggled = value;
                    });
                  },
                  activeColor: Colors.blue, // Color when toggled on
                  inactiveThumbColor: Colors.grey, // Color when toggled off
                  inactiveTrackColor:
                      Colors.grey.shade300, // Track color when off
                ),
              ],
            ),
            Spacer(),
            MyBlueButton(text: "Proceed"),
            SizedBox(
              height: getFontSize(40, context),
            )
          ],
        ),
      ),
    ));
  }
}
