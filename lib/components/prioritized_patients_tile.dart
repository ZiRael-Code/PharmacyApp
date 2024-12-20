import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrioritizedPatientsTile extends StatelessWidget {
  final String name;

  PrioritizedPatientsTile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10), // Add padding for spacing
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top
        children: [
          // Profile picture
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.transparent,
              ),
              width: getFontSize(50, context),
              height: getFontSize(50, context),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset("assets/images/ppp.png"))),
          SizedBox(width: getFontSize(10, context)), // Spacing between image and text

          // Name and hospital details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Space out row items
                  children: [
                    Text(
                      "$name ⭐",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFontSize(16, context),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/images/dots.svg",
                      width: getFontSize(20, context), // Ensure consistent size
                      height: getFontSize(20, context),
                    ),
                  ],
                ),
                SizedBox(height: getFontSize(5, context)), // Adjust vertical spacing
                Text(
                  "Hospital",
                  style: TextStyle(
                    color: Colors.grey, // Add subtle styling
                    fontSize: getFontSize(14, context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}