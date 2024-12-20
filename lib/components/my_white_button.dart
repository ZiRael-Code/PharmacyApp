import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';

class MyWhiteButton extends StatelessWidget {
  final String text;
  MyWhiteButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: getFontSize(16, context)),
        ),
      ),
    );
  }
}