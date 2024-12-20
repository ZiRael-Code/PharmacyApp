import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemTile extends StatefulWidget {
  ItemTile({super.key});

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getFontSize(15, context)),
      child: Container(
        width: getFontSize(195, context),
        height: getFontSize(325, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300)),
        child: Column(
          children: [
            SizedBox(
              height: getFontSize(30, context),
            ),
            Container(
              width: getFontSize(112, context),
              height: getFontSize(112, context),
              decoration: BoxDecoration(
                  color: Colors.grey[200], shape: BoxShape.circle),
              child: CircleAvatar(
                child: SvgPicture.asset("assets/images/box_item.svg"),
              ),
            ),
            SizedBox(
              height: getFontSize(20, context),
            ),
            Text(
              "Wellue BP2 connect device",
              style: TextStyle(fontSize: getFontSize(12, context), fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: getFontSize(10, context),
            ),
            Container(
              width: getFontSize(112, context),
              height: getFontSize(26, context),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  "Measures 1 vital",
                  style: TextStyle(
                    fontSize: getFontSize(12, context),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getFontSize(10, context),
            ),
            Text(
              "N25,000",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: getFontSize(20, context)),
            ),
            SizedBox(
              height: getFontSize(15, context),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.blue.shade100)),
              width: getFontSize(102.87, context),
              height: getFontSize(30.46, context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[100], shape: BoxShape.circle),
                    width: getFontSize(15.8, context),
                    height: getFontSize(15.8, context),
                    child: Icon(
                      Icons.remove,
                      size: getFontSize(12, context),
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "0",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[100], shape: BoxShape.circle),
                    width: getFontSize(15.8, context),
                    height: getFontSize(15.8, context),
                    child: Icon(
                      Icons.add,
                      size: getFontSize(12, context),
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getFontSize(20, context),
            )
          ],
        ),
      ),
    );
  }
}