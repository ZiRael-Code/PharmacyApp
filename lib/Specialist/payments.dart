import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/my_blue_button.dart';
import '../decive distribution/card_details.dart';
import '../decive distribution/deviced_ordered.dart';

class Payments extends StatefulWidget {
  Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  // Track the expanded state for specific tiles
  bool isCashOnDeliveryExpanded = false;
  bool isBankTransferExpanded = false;

  // Checkbox state for Cash on Delivery
  bool isCashOnDeliverySelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getFontSize(20, context)),
          child: Column(
            children: [
              SizedBox(height: getFontSize(40, context)),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: getFontSize(45, context),
                      height: getFontSize(45, context),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFFE5E5E5),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/back.svg',
                        width: getFontSize(12.0, context),
                        height: getFontSize(12.0, context),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: getFontSize(90, context)),
                  Text(
                    "Payments",
                    style: TextStyle(
                        fontSize: getFontSize(28, context),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: getFontSize(40, context)),

              // Cash on Delivery Tile
              buildPaymentOption(
                title: "Cash on delivery",
                iconPath: "assets/images/cart.svg",
                isExpanded: isCashOnDeliveryExpanded,
                onExpandToggle: () {
                  setState(() {
                    isCashOnDeliveryExpanded = !isCashOnDeliveryExpanded;
                  });
                },
                expandedContent: Column(
                  children: [
                    SizedBox(
                        width: getFontSize(280, context),
                        child: Divider(
                          color: Colors.grey.shade200,
                        )),
                    Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          shape: CircleBorder(), // Makes the checkbox circular
                        ),
                      ),
                      child: CheckboxListTile(
                        value: isCashOnDeliverySelected,
                        onChanged: (value) {
                          setState(() {
                            isCashOnDeliverySelected = value ?? false;
                          });
                        },
                        title: Text(
                          "Select this payment method",
                          style: TextStyle(fontSize: getFontSize(14, context)),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getFontSize(10, context)),

              // Credit/Debit Card Tile
              GestureDetector(
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => CardDetails())),
                child: buildPaymentOption(
                  title: "Credit / Debit card",
                  iconPath: "assets/images/creditcardicon.svg",
                  isExpanded: false, // No expand functionality for now
                  onExpandToggle: null, // Expand button disabled
                  expandedContent: SizedBox.shrink(), // No expanded content
                  showArrowIcon: true, // Add down arrow icon only
                ),
              ),
              SizedBox(height: getFontSize(10, context)),

              // Bank Transfer Tile
              buildPaymentOption(
                title: "Bank transfer",
                iconPath: "assets/images/bank.svg",
                isExpanded: isBankTransferExpanded,
                onExpandToggle: () {
                  setState(() {
                    isBankTransferExpanded = !isBankTransferExpanded;
                  });
                },
                expandedContent: Column(
                  children: [
                    SizedBox(
                        width: getFontSize(280, context),
                        child: Divider(
                          color: Colors.grey.shade200,
                        )),
                    SizedBox(
                      height: getFontSize(10, context),
                    ),
                    Text(
                      "First Bank Of Nigeria PLC",
                      style: TextStyle(
                        fontSize: getFontSize(14, context),
                      ),
                    ),
                    SizedBox(
                      height: getFontSize(10, context),
                    ),
                    Container(
                      width: getFontSize(252, context),
                      height: getFontSize(50, context),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: getFontSize(8, context),
                              right: getFontSize(8, context),
                            ),
                            child: Text(
                              "0123456789",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: getFontSize(28, context),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: getFontSize(80, context),
                            height: getFontSize(32, context),
                            decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/images/copyicon.svg"),
                                SizedBox(
                                  width: getFontSize(6, context),
                                ),
                                Text(
                                  "Copy",
                                  style: TextStyle(
                                      fontSize: getFontSize(12, context)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getFontSize(10, context),
                    ),
                    Text(
                      "APPLINIC BANK ACCOUNT",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: getFontSize(12, context)),
                    ),
                    SizedBox(
                      height: getFontSize(10, context),
                    )
                  ],
                ),
              ),
              Spacer(),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DevicedOrdered())),
                      child: MyBlueButton(text: "Continue"))),
              SizedBox(height: getFontSize(40, context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPaymentOption({
    required String title,
    required String iconPath,
    required bool isExpanded,
    required VoidCallback? onExpandToggle,
    required Widget expandedContent,
    bool showArrowIcon = false, // New parameter to control the arrow icon
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: getFontSize(10, context),
                horizontal: getFontSize(10, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon and text row
                Row(
                  children: [
                    Container(
                      width: getFontSize(42, context),
                      height: getFontSize(42, context),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          iconPath,
                          width: getFontSize(10.0, context),
                          height: getFontSize(10.0, context),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: getFontSize(20, context)),
                    Text(
                      title,
                      style: TextStyle(fontSize: getFontSize(14, context)),
                    ),
                  ],
                ),
                // Expand/Collapse button or just arrow icon
                if (onExpandToggle != null || showArrowIcon)
                  IconButton(
                    onPressed: onExpandToggle,
                    icon: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
          ),
          // Expanded content
          if (isExpanded)
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getFontSize(10, context),
                  vertical: getFontSize(5, context)),
              child: expandedContent,
            ),
        ],
      ),
    );
  }
}
