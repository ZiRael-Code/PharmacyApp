import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'MainScreen/Dashboard.dart';

class DynamicSuccess extends StatefulWidget {
  final dynamic dart_name;
  final String text;
  final String buttonText;
  DynamicSuccess(
      {super.key,
      this.dart_name,
      required this.text,
      required this.buttonText});

  @override
  State<DynamicSuccess> createState() => _DynamicSuccessState();
}

class _DynamicSuccessState extends State<DynamicSuccess> {
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
                  'Success',
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
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: getFontSize(30, context)),
                Container(
                  width: getFontSize(230, context),
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: getFontSize(18, context),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (builder) =>
                                widget.dart_name), // Navigate to Login screen
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue,
                      ),
                      padding: EdgeInsets.all(12),
                      child: Text(
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: getFontSize(16, context)),
                          widget.buttonText),
                    ))
              ],
            )));
  }
}
