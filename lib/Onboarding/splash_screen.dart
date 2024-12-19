import '../MainScreen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/Vector.png",
                scale: 1,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: getFontSize(200, context),
            ),
            Center(
              child: SizedBox(
                width: getFontSize(300, context),
                height: getFontSize(80, context),
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset("assets/images/myvitalz.png"),
                    ),
                    Positioned(
                      right: getFontSize(0, context),
                      bottom: getFontSize(0, context),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset("assets/images/doctorsvg.svg"),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}