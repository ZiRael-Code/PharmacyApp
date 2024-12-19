import '../MainScreen/Dashboard.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'PrescribeDrugsViewAll.dart';

class PrescribeDrugsAddDrugs extends StatefulWidget{
  PrescribeDrugsAddDrugs({super.key});

  @override
  _PrescribeDrugsAddDrugsState createState() => _PrescribeDrugsAddDrugsState();
}

class _PrescribeDrugsAddDrugsState extends State<PrescribeDrugsAddDrugs> {

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
                  'Prescribe drugs',
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
        body: Padding(
          padding: EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            inputField(
              label: 'Drug name',
              hint: 'Type drug name',
              maxLength: 1,
              leftIcon: false,
            ),
            inputField(
              label: 'Drug type',
              hint: 'e.g syrups',
              maxLength: 1,
              leftIcon: true,
            ),
            inputField(
              label: 'Quantity',
              hint: 'e.g 2 sachets or 1 pack ',
              maxLength: 1,
              leftIcon: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                inputField2(
                label: 'Quantity',
                hint: 'e.g 2 sachets or 1 pack ',
                leftIcon: true,
                  width: getFontSize(150.0, context)
              ),
                inputField2(
                label: 'Frequency',
                hint: 'e.g 2 sachets or 1 pack ',
                leftIcon: true,
                  width: getFontSize(150.0, context)
              ),
               ],
            ),
            inputField(
              label: 'Additional Information',
              hint: 'e.g additional notes ',
              maxLength: 4,
              leftIcon: false,
            ),
            SizedBox(height: getFontSize(10, context),),

                Align(
                  child:
                Container(
                  decoration: BoxDecoration(color: Color(0xffE2EDFF), borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.add_circle_outline,color: Colors.blue,),
                        SizedBox(width: getFontSize(8, context),),
                        Text('Add Prescription', style: TextStyle(fontSize: getFontSize(14, context), color: Colors.blue)),
                        SizedBox(width: getFontSize(6, context),),
                      ]
                  ),
                  ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>PrescribeDrugsViewAll()));
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
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                ),
              ),
            ),

          ],
        )
        )
    );
  }

  inputField({
    required String label,
    required String hint,
    required int maxLength,
    required bool leftIcon,
    width
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: getFontSize(16, context)),),
        SizedBox(height: getFontSize(10, context),),

        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black26),
            filled: true,
            fillColor: Colors.grey[200], // Light gray background
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12), // Circular border radius
              borderSide: BorderSide(
                color: Colors.grey.shade300, // Light gray border
                width: getFontSize(1, context), // Border thickness
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: getFontSize(1, context),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
                width: getFontSize(1.5, context),
              ),
            ),
            suffixIcon: leftIcon
                ? Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Colors.black45,
            )
                : null, // Optional suffix icon
            constraints: BoxConstraints(
              maxWidth: 331, // Set the fixed width for the TextField
            ),
          ),
          maxLines: maxLength, // Ensures single-line input
        ),

        SizedBox(height: getFontSize(15, context),), // Additional vertical space between fields
      ],
    );
  }

inputField2({
  required String label,
  required String hint,
  required bool leftIcon,
  width
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(fontSize: getFontSize(16, context)),
      ),
      SizedBox(height: getFontSize(10, context)),
      Container(
        width: width, // Set the fixed width
        decoration: BoxDecoration(
          color: Colors.grey[200], // Light gray background
          borderRadius: BorderRadius.circular(12), // Circular border radius
          border: Border.all(
            color: Colors.grey.shade300, // Light gray border
            width: getFontSize(1, context), // Border thickness
          ),
        ),
        child: Row(
          children: [

            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.black26),
                  border: InputBorder.none, // Remove default TextField border
                  contentPadding: EdgeInsets.symmetric(
                    vertical: getFontSize(14, context),
                    horizontal: leftIcon ? 8 : 14,
                  ), // Add padding inside the container
                ),
              ),
            ),
            if (leftIcon) // Optionally display the suffix icon
              Padding(
                padding: EdgeInsets.only(right: getFontSize(8.0, context)),
                child: Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: Colors.black45,
                ),
              ),
          ],
        ),
      ),
      SizedBox(height: getFontSize(15, context)), // Additional vertical space between fields
    ],
  );
}
}