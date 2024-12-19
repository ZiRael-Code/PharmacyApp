import 'package:pharmacy_app/add%20pharmacy/set_network_pharmacy.dart';
import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/my_blue_button.dart';

class SendInvitesSuccessfulPagePharmacy extends StatelessWidget {
  SendInvitesSuccessfulPagePharmacy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getFontSize(25, context)),
          child: Column(
            children: [
              SizedBox(height: getFontSize(40, context)),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
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
                  ),
                ],
              ),
              SizedBox(
                height: getFontSize(20, context),
              ),
              Center(
                child: Text(
                  "Success!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getFontSize(28, context),
                  ),
                ),
              ),
              SizedBox(
                height: getFontSize(20, context),
              ),
              SizedBox(
                width: getFontSize(270, context),
                height: getFontSize(47, context),
                child: Text(
                  textAlign: TextAlign.center,
                  "You have successfully added pharmacy(ies) to your hospital network.",
                  style: TextStyle(
                    fontSize: getFontSize(14, context),
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SetupNetworkPharmacy1())),
                  child: MyBlueButton(text: "Done")),
              SizedBox(
                height: getFontSize(30, context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
