import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'PrescriptionSentSuccess.dart';

void main() {
  runApp(SendPrescription());
}



class SendPrescription extends StatefulWidget {
  @override
  _SendPrescriptionState createState() => _SendPrescriptionState();
}

class _SendPrescriptionState extends State<SendPrescription> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
                child: SvgPicture.asset('assets/images/back.svg',
                  width: getFontSize(8.0, context),
                  height: getFontSize(15, context),),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                child:
                Text(
                  'Send prescription',
                  style: TextStyle(
                      fontSize: getFontSize(20, context),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Spacer(),

            ],
          ),
        ),
        body: Padding(padding: EdgeInsets.all(12),
          child: Column(
          children: [

            SizedBox(height: getFontSize(20, context),),

            Wrap(
              direction: Axis.horizontal,
              children: [
                Row(
                  children: [
                    Text("Name:", style: TextStyle(color: Colors.black45)),
                    Spacer(),
                    Text("12/06/2022 - Prescriptions"),
                  ],
                ),
                SizedBox(height: getFontSize(30, context)),
                Row(
                  children: [
                    Text("Prescribed by:", style: TextStyle(color: Colors.black45)),
                    Spacer(),
                    Text("Dr. Muiz Sanni", ),
                  ],
                ),
                SizedBox(height: getFontSize(30, context)),
                Row(
                  children: [
                    Text("For:", style: TextStyle(color: Colors.black45)),
                    Spacer(),
                    Text("Janet Okoli"),
                  ],
                ),
                SizedBox(height: getFontSize(30, context)),
                Row(
                  children: [
                    Text("Date:", style: TextStyle(color: Colors.black45),),
                    Spacer(),
                    Text("22 June 2022"),
                  ],
                ),
              ],
            ),
              SizedBox(height: getFontSize(25, context),),



            drug(
              name: 'Ibuprofen',
              dosage: '1 pill(s)',
              instructions: '2X daily',
              drugUnit: '1 pack:  '
            ),

            SizedBox(height: getFontSize(20, context),),


            Spacer(),

            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Color(0xFFF2F2F2),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info, color: Colors.black45,),
                  SizedBox(width: getFontSize(10, context)),
                  SizedBox(
                      width: getFontSize(250, context),
                      child:
                      Text("Prescription will be sent to patient as a message", softWrap: true,)
                  ),
                ],
              ),
            ),

            SizedBox(height: getFontSize(40, context),),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>Prescriptionsentsuccess()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: getFontSize(12.0, context), horizontal: getFontSize(24.0, context)),
                child: Text(
                  'Send',
                  style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                ),
              ),
            ),
          ],
        ),
        ),
    );
  }

  drug({
    required String name,
    required String dosage,
    required String instructions,
    required String drugUnit
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200, width: getFontSize(1, context)),
      ),
        child: Row(
          children: [
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(name, style: TextStyle(fontSize: getFontSize(18, context))),
            SizedBox(height: getFontSize(10, context),),
          Row(
          children: [
            Text(drugUnit, style: TextStyle(color: Colors.grey[500]),),
            Text('$dosage . $instructions', style: TextStyle(color: Colors.grey[500])),
          ],
        ),
        ],
        ),

          ],
        ),
    );
  }
}