import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../MainScreen/Dashboard.dart';

class Drugs extends StatefulWidget {
  const Drugs({super.key});

  @override
  State<Drugs> createState() => _DrugsState();
}

class _DrugsState extends State<Drugs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(padding: EdgeInsets.all(0),
    child: SingleChildScrollView(
      child: Column(
      children: [
        SizedBox(height: getFontSize(10, context),),
        drug(
            name: "Ibuprofen x2",
            usage: 'Habeeb Fajimite - 11/04/2022',
            price: "N25,000"

        ),
        drug(
            name: "Ibuprofen x2, Paracetamol x2 ...",
            usage: 'Habeeb Fajimite - 11/04/2022',
            price: "N25,000"
        ),
        drug(
            name: "Paracetamol",
            usage: 'Habeeb Fajimite - 11/04/2022',
            price: "N25,000"
        ),
        drug(
            name: "Ibuprofen x2, Paracetamol x2 ...",
            usage: 'Habeeb Fajimite - 11/04/2022',
            price: "N25,000"
        ),
        drug(
            name: "Paracetamol",
            usage: 'Habeeb Fajimite - 11/04/2022',
            price: "N25,000"
        ),
        drug(
            name: "Ibuprofen x2, Paracetamol x2 ...",
            usage: 'Habeeb Fajimite - 11/04/2022',
            price: "N25,000"
        ),
        drug(
            name: "Paracetamol",
            usage: 'Habeeb Fajimite - 11/04/2022',
            price: "N25,000"
        ),
      ],
    ),
    ),
    ),
    );
  }

  drug({
    required String name,
    required String usage,
    required String price,

  }) {
    return Container(
      padding: EdgeInsets.all(14),
      width: double.infinity,
      margin: EdgeInsets.only(bottom: getFontSize(10, context)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey,
          width: getFontSize(1.0, context),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontSize: getFontSize(16, context)),),
              SizedBox(height: getFontSize(8, context),),
              Text(usage, style: TextStyle(color: Color(0xff666666)))
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: TextStyle(fontSize: getFontSize(16, context), color: Colors.blue, fontWeight: FontWeight.bold),)
              ,Text(
                "View details >",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  decorationThickness: 1.5,
                ),
              )

            ],
          )
        ],
      ),
    );
  }

}
