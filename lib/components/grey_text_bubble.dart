import 'package:flutter/material.dart';

class GreyTextBubble extends StatelessWidget {
  final String text;

  const GreyTextBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // Light grey background
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20), // Rounded top-right corner
          bottomLeft: Radius.circular(20), // Rounded bottom-left corner
          bottomRight: Radius.circular(20), // Rounded bottom-right corner
        ),
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width *
            0.7, // Max width is 70% of screen width
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87, // Darker text for better readability
        ),
      ),
    );
  }
}
