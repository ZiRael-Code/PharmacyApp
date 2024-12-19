import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllMed extends StatefulWidget {
  AllMed({super.key});

  @override
  State<AllMed> createState() => _AllMedState();
}

class _AllMedState extends State<AllMed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:
          Column(
        children: [
          med(
            name: "Sapaprofen",
            type: "Liquid",
            ql: "95",
            price: "N20,000"
          ),
           med(
            name: "Sapaprofen",
            type: "Liquid",
            ql: "95",
            price: "N20,000"
          ),
           med(
            name: "Sapaprofen",
            type: "Liquid",
            ql: "95",
            price: "N20,000"
          ),
           med(
            name: "Sapaprofen",
            type: "Liquid",
            ql: "95",
            price: "N20,000"
          ),
           med(
            name: "Sapaprofen",
            type: "Liquid",
            ql: "95",
            price: "N20,000"
          ),
           med(
            name: "Sapaprofen",
            type: "Liquid",
            ql: "95",
            price: "N20,000"
          ),

        ],
      ),
    )
    );
  }

  med({required String name,
    required String type,
    required String ql,
    required String price
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("$name  ", style: TextStyle(fontWeight: FontWeight.w500, fontSize: getFontSize(16, context) ),),
            Text("($type)", style: TextStyle(color: Colors.black26)),
            Spacer(),
            Text("Qty left:"),
            SizedBox(width: getFontSize(13, context)),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200
              ),
              child: Text(ql),
            )
          ],
        ),
        Text(price, style: TextStyle(fontSize: getFontSize(18, context),
            fontWeight: FontWeight.w500,
            color: Colors.black45),),
        SizedBox(height: getFontSize(10, context),),
        SvgPicture.asset("assets/images/line.svg"),
        SizedBox(height: getFontSize(10, context),)
      ],
    );
  }
}