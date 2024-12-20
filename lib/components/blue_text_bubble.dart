import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';

class BlueTextBubble extends StatelessWidget {
  final String text;

  BlueTextBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.blue, // Light grey background
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), // Rounded top-right corner
            bottomLeft: Radius.circular(20), // Rounded bottom-left corner
            topLeft: Radius.circular(20)),
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width *
            0.7, // Max width is 70% of screen width
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: getFontSize(14, context),
          color: Colors.white, // Darker text for better readability
        ),
      ),
    );
  }
}