import 'package:flutter/material.dart';

//--------------------------- screen height & width ----------------------------

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

//--------------------------- Colors ----------------------------------

const Color whiteText = const Color(0xFFFFFFFF);
//const Color brownText = const Color(0xffAA9171);
const Color blackText = const Color(0xff4D4D4D);
const Color orangeColor = const Color(0xFFCA5116);

MaterialColor customRedColor = MaterialColor(0xFF7c3521, redColor);

Map<int, Color> redColor = {
  50: Color.fromRGBO(124, 53, 33, .1),
  100: Color.fromRGBO(124, 53, 33, .2),
  200: Color.fromRGBO(124, 53, 33, .3),
  300: Color.fromRGBO(124, 53, 33, .4),
  400: Color.fromRGBO(124, 53, 33, .5),
  500: Color.fromRGBO(124, 53, 33, .6),
  600: Color.fromRGBO(124, 53, 33, .7),
  700: Color.fromRGBO(124, 53, 33, .8),
  800: Color.fromRGBO(124, 53, 33, .9),
  900: Color.fromRGBO(124, 53, 33, 1)
};
