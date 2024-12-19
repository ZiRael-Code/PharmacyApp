import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../component/messages_tile.dart';
import 'Chat.dart';

class Messages extends StatefulWidget {
  Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<Map<String, dynamic>> contacts = [
    {
      "name": "Janet Okoli",
      "imagePath": "assets/images/janet.jpg",
      "unreadCount": 1,
      "status": "online",
    },
    {
      "name": "Adejayo Johnson",
      "imagePath": "assets/images/adejayo.jpg",
      "unreadCount": 0,
      "status": "offline",
    },
    {
      "name": "Dr. Nelson Yang",
      "imagePath": "assets/images/yang.jpg",
      "unreadCount": 2,
      "status": "online",
    },
    {
      "name": "Adejayo Johnson",
      "imagePath": "assets/images/adejayo.jpg",
      "unreadCount": 0,
      "status": "offline",
    },
    {
      "name": "Dr. Nelson Yang",
      "imagePath": "assets/images/yang.jpg",
      "unreadCount": 2,
      "status": "online",
    },
  ];

  List<Map<String, dynamic>> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    filteredContacts = contacts;
  }

  void _filterContacts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredContacts = contacts;
      } else {
        filteredContacts = contacts
            .where((contact) =>
                contact["name"].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getFontSize(15, context)),
          child: Column(
            children: [
              SizedBox(height: getFontSize(40, context)),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
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
                  ),
                  SizedBox(width: getFontSize(60, context)),
                  Text(
                    "Messages",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getFontSize(20, context),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getFontSize(35, context)),
              Container(
                height: getFontSize(50, context),
                padding: EdgeInsets.all(4),
                width: getFontSize(350, context),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextField(
                  onChanged: _filterContacts,
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(fontSize: getFontSize(14, context), color: Colors.grey[400]),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.grey[400],
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: getFontSize(20, context)),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredContacts.length,
                  itemBuilder: (context, index) {
                    final contact = filteredContacts[index];
                    return MessagesTile(
                      name: contact["name"],
                      imagePath: contact["imagePath"],
                      unreadCount: contact["unreadCount"],
                      status: contact["status"],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Chat(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}