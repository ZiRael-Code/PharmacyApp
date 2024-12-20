import 'package:pharmacy_app/Patient/PrescribeDrugs.dart';

import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'SendPrescription.dart';

void main() {
  runApp(PrescribeDrugsViewAll());
}

class PrescribeDrugsViewAll extends StatefulWidget {
  @override
  _PrescribeDrugsViewAllState createState() => _PrescribeDrugsViewAllState();
}

class _PrescribeDrugsViewAllState extends State<PrescribeDrugsViewAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
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
            Spacer(),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Prescribe drugs',
                style: TextStyle(
                    fontSize: getFontSize(20, context),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            drug(
                name: 'Ibuprofen',
                dosage: '1 pill(s)',
                instructions: '2X daily',
                drugUnit: '1 pack:  '),
            SizedBox(
              height: getFontSize(20, context),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) => PrescribeDrugs()));
              },
              child: Align(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffE2EDFF),
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: getFontSize(8, context),
                        ),
                        Text('Add Prescription',
                            style: TextStyle(
                                fontSize: getFontSize(14, context),
                                color: Colors.blue)),
                        SizedBox(
                          width: getFontSize(6, context),
                        ),
                      ]),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (builder) => SendPrescription()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getFontSize(12.0, context),
                    horizontal: getFontSize(24.0, context)),
                child: Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.white, fontSize: getFontSize(18, context)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  drug(
      {required String name,
      required String dosage,
      required String instructions,
      required String drugUnit}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: Colors.grey.shade200, width: getFontSize(1, context)),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontSize: getFontSize(18, context))),
              SizedBox(
                height: getFontSize(10, context),
              ),
              Row(
                children: [
                  Text(
                    drugUnit,
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  Text('$dosage . $instructions',
                      style: TextStyle(color: Colors.grey[500])),
                ],
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.keyboard_arrow_down)
        ],
      ),
    );
  }
}
