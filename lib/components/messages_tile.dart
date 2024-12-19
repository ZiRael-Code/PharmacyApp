import 'package:flutter/material.dart';

class MessagesTile extends StatelessWidget {
  final String name;
  final String imagePath;
  final int unreadCount;
  final String status;
  final VoidCallback onTap;

  const MessagesTile({
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
                  bottom: 0,
                  right: 1,
                  child: Container(
                    width: 12,
                    height: 12,
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
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Container(
                child: unreadCount > 0
                    ? CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.blue,
                        child: Text(
                          "$unreadCount",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      )
                    : Text("5min",
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 12)),
              )
            ],
          ),
          subtitle: const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "After taking the prescribed medications...",
              style: TextStyle(fontSize: 12),
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

  const MessageDetailsPage({super.key, required this.contactName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contactName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Text("Conversation with $contactName"),
      ),
    );
  }
}
