import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrioritizedPatientsTile extends StatelessWidget {
  final String name;

  const PrioritizedPatientsTile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10), // Add padding for spacing
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top
        children: [
          // Profile picture
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.transparent,
              ),
              width: 50,
              height: 50,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset("assets/images/ppp.png"))),
          const SizedBox(width: 10), // Spacing between image and text

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
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/images/dots.svg",
                      width: 20, // Ensure consistent size
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 5), // Adjust vertical spacing
                const Text(
                  "Hospital",
                  style: TextStyle(
                    color: Colors.grey, // Add subtle styling
                    fontSize: 14,
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
