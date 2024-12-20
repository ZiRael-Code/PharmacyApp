import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';

class MessagesTile extends StatelessWidget {
  final String name;
  final String imagePath;
  final int unreadCount;
  final String status;
  final VoidCallback onTap;

  MessagesTile({
    super.key,
    required this.name,
    required this.imagePath,
    required this.unreadCount,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(imagePath),
              ),
              if (status == "online")
                Positioned(
                  bottom: getFontSize(0, context),
                  right: getFontSize(1, context),
                  child: Container(
                    width: getFontSize(12, context),
                    height: getFontSize(12, context),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: getFontSize(16, context)),
              ),
              Container(
                child: unreadCount > 0
                    ? CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.blue,
                        child: Text(
                          "$unreadCount",
                          style: TextStyle(
                              color: Colors.white, fontSize: getFontSize(12, context)),
                        ),
                      )
                    : Text("5min",
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: getFontSize(12, context))),
              )
            ],
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: getFontSize(5, context)),
            child: Text(
              "After taking the prescribed medications...",
              style: TextStyle(fontSize: getFontSize(12, context)),
            ),
          ),
        ),
        Divider(
          thickness: 1, // Adjust thickness of the divider
          indent: 30, // Matches the left margin of the ListTile content
          endIndent: 16, // Matches the right margin of the ListTile content
          color: Colors.grey[200], // Adjust the divider color
        ),
      ],
    );
  }
}

class MessageDetailsPage extends StatelessWidget {
  final String contactName;

  MessageDetailsPage({super.key, required this.contactName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contactName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Text("Conversation with $contactName"),
      ),
    );
  }
}