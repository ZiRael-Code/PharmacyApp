import 'package:pharmacy_app/Account/Referral/my_blue_button.dart';
import 'package:pharmacy_app/MainScreen/Dashboard.dart';
import 'package:pharmacy_app/Onboarding/upload_id_card_validator.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadIdCard extends StatefulWidget {
  UploadIdCard({super.key});

  @override
  State<UploadIdCard> createState() => _UploadIdCardState();
}

class _UploadIdCardState extends State<UploadIdCard> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }

    if (pickedFile != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UploadIdCardValidator(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getFontSize(60, context),
                ),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/Frame 1308.png",
                        width: getFontSize(65, context),
                      ),
                      SizedBox(
                        height: getFontSize(60, context),
                      ),
                      Text(
                        "Upload ID Card",
                        style: TextStyle(
                            fontSize: getFontSize(28, context),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: getFontSize(50, context),
                      ),
                      DottedBorder(
                        color: Colors.grey.withOpacity(0.70),
                        radius: Radius.circular(19),
                        dashPattern: [8, 6],
                        borderType: BorderType.RRect,
                        strokeWidth: 2,
                        child: Column(
                          children: [
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade100),
                              width: getFontSize(245, context),
                              height: getFontSize(230, context),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: getFontSize(50, context),
                                  ),
                                  _selectedImage != null
                                      ? Image.file(
                                          _selectedImage!,
                                          width: getFontSize(150, context),
                                          height: getFontSize(150, context),
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          "assets/images/filelogo.png"),
                                  SizedBox(
                                    height: getFontSize(30, context),
                                  ),
                                  Text(
                                    "Accepted formats: .jpg, .png",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: getFontSize(20, context),
                                  ),
                                  Container(
                                    height: getFontSize(55, context),
                                    padding: EdgeInsets.only(
                                        left: getFontSize(50, context),
                                        right: getFontSize(50, context),
                                        top: getFontSize(10, context),
                                        bottom: getFontSize(10, context)),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: TextButton(
                                      onPressed: _pickImage,
                                      child: Text(
                                        "Upload ID",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getFontSize(50, context),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Liscence Type",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getFontSize(14, context)),
                      ),
                    ),
                    SizedBox(
                      height: getFontSize(10, context),
                    ),
                    Container(
                      height: getFontSize(50, context),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: getFontSize(10, context)),
                            child: Text(
                              "e.g basic or advanced",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_drop_down),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: getFontSize(40, context),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UploadIdCardValidator(),
                    ),
                  ),
                  child: MyBlueButton(text: "Continue"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
