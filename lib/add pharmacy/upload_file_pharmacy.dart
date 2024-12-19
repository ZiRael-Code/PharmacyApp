import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UploadFile extends StatefulWidget {
  UploadFile({super.key});

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: getFontSize(20, context),
          ),
          Center(
            child: Container(
              width: getFontSize(284, context),
              height: getFontSize(47, context),
              child: Text(
                textAlign: TextAlign.center,
                "Upload all your patients and their details to sync with myvitalz.",
                style: TextStyle(fontSize: getFontSize(14, context), color: Colors.grey),
              ),
            ),
          ),
          SizedBox(
            height: getFontSize(60, context),
          ),
          Container(
            width: getFontSize(183, context),
            height: getFontSize(183, context),
            decoration:
                BoxDecoration(color: Colors.blue[50], shape: BoxShape.circle),
            child: Container(
              height: getFontSize(150, context),
              child: SvgPicture.asset("assets/images/report.svg"),
            ),
          ),
          SizedBox(
            height: getFontSize(30, context),
          ),
          Center(
            child: Container(
              width: getFontSize(284, context),
              height: getFontSize(47, context),
              child: Text(
                textAlign: TextAlign.center,
                "Click to upload a file containing all your patient details.",
                style: TextStyle(fontSize: getFontSize(14, context), color: Colors.grey),
              ),
            ),
          ),
          SizedBox(
            height: getFontSize(100, context),
          ),
          Container(
            width: getFontSize(335, context),
            height: getFontSize(54, context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.blue.shade50,
                border: Border.all(color: Colors.blue.shade50)),
            child: Center(
              child: Text(
                "Add manually",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}