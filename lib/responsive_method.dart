import 'package:flutter/cupertino.dart';

getFontSize(double d, BuildContext context) {
  return d * (MediaQuery.of(context).size.width / 375.0 + MediaQuery.of(context).size.height / 812.0) / 2.0;
}

getHalfWidthScreenSize(double size, int paddingSize, BuildContext context) {
  return ((MediaQuery.of(context).size.width) / 2) - paddingSize;
}