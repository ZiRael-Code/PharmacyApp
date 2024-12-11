import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'PrescribeDrugsAddDrug.dart';
import 'SelectPharmacy.dart';

void main() {
  runApp(PrescribeDrugs());
}

class PrescribeDrugs extends StatelessWidget {
  PrescribeDrugs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5),
                ),
                child: SvgPicture.asset('assets/images/back.svg',
                  width: 8.0,
                  height: 15,),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                child:
                Text(
                  'Prescribe drugs',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Spacer(),

            ],
          ),
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to the next screen
                Navigator.push(context, MaterialPageRoute(builder: (context) => PrescribeDrugsAddDrugs()));
    },
              child:
            fundMethod(text: "Prescribe from personal store",
                imagePath: Icon(Icons.add_home_work_outlined, color: Colors.blue,),
                icon:  Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue,)
                ,bottom: 'For doctors who have personal ministore'
            ),
            ),
    GestureDetector(
    onTap: () {
    // Navigate to the next screen
    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectPharmacy()));
    },
          child:  fundMethod(text: "Prescribe from existing pharmacy",
                imagePath: Icon(Icons.medication_liquid_sharp, color: Colors.blue,),
                icon:  Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue,)
            ),
            ),
    GestureDetector(
    onTap: () {
    // Navigate to the next screen
    Navigator.push(context, MaterialPageRoute(builder: (context) => PrescribeDrugsAddDrugs()));
    },
    child:
            fundMethod(text: "Send a prescriptiption list",
                imagePath: Icon(Icons.task_rounded, color: Colors.blue,),
                icon:  Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue,)
            ),
            ),
          ],
        ),
    );
  }
}

fundMethod (
    {

      required String text,
      required Icon imagePath,
      required Icon icon,
      bottom,
    }){
  return Padding(padding: EdgeInsets.all(15),
    child: Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      height: 74,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFFE5E5E5),
          width: 0.5,
        ),
      ),
      child: Row(children: [
        Container(
          width: 42,
          height: 42,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFFE2EDFF),
            shape: BoxShape.circle,
          ),
          child: imagePath,
        ),
        SizedBox(width: 25,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text(
          text,
          style: TextStyle(
            color: Color(0xFF2E2E42),
            fontSize: 16,
          ),
        ),
         bottom != null ? SizedBox(height: 5,) : Container(),
          bottom != null ? Text(
            bottom,
            style: TextStyle(
              color: Color(0xFF959595),
              fontSize: 12,
            ),
          )
          : Container()
        ],),
        Spacer(),
        icon
      ],),
    ),
  );
}