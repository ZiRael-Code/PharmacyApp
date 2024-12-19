import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemTile extends StatefulWidget {
  const ItemTile({super.key});

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        width: 195,
        height: 325,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300)),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                  color: Colors.grey[200], shape: BoxShape.circle),
              child: CircleAvatar(
                child: SvgPicture.asset("assets/images/box_item.svg"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Wellue BP2 connect device",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 112,
              height: 26,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  "Measures 1 vital",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "N25,000",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.blue.shade100)),
              width: 102.87,
              height: 30.46,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[100], shape: BoxShape.circle),
                    width: 15.8,
                    height: 15.8,
                    child: Icon(
                      Icons.remove,
                      size: 12,
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
                    width: 15.8,
                    height: 15.8,
                    child: Icon(
                      Icons.add,
                      size: 12,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
