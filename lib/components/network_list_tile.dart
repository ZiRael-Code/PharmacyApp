import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';

class NetworkListTile extends StatefulWidget {
  final bool isChecked; // Add the isChecked property

  NetworkListTile({
    super.key,
    this.isChecked = false, // Default value set to false
  });

  @override
  State<NetworkListTile> createState() => _NetworkListTileState();
}

class _NetworkListTileState extends State<NetworkListTile> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked; // Initialize isChecked with the passed value
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: getFontSize(5, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/guild.png"),
                  radius: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getFontSize(20, context),
                    ),
                    Text(
                      "Guild of Nigerian Doctors",
                      style: TextStyle(
                        fontSize: getFontSize(16, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: getFontSize(14, context),
                    ),
                  ],
                ),
                SizedBox(
                  width: getFontSize(40, context),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Container(
                    height: getFontSize(24, context),
                    width: getFontSize(24, context),
                    decoration: BoxDecoration(
                      color: isChecked ? Colors.green : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: isChecked
                        ? Icon(
                            Icons.check,
                            color: Colors.white,
                            size: getFontSize(16, context),
                          )
                        : null,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getFontSize(5, context),
            ),
            SizedBox(
              width: getFontSize(350, context),
              child: Divider(
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}