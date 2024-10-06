import 'package:flutter/material.dart';

class ColorConstants {
  ColorConstants._();
  static final ColorConstants _instance = ColorConstants._();
  factory ColorConstants() => _instance;

// DEFAULT COLOR SCHEME FOR BACKGROUND
  Color primaryColor = const Color(0xFFFFFFFF);
  Color primaryDarkColor =
      Color.fromARGB(255, 28, 28, 28); //to set the dark color
  Color lightBackgroundColor = Color.fromARGB(245, 249, 253, 1);

  Color darkTextColor = Colors.black;
  Color blueTextColor = const Color.fromRGBO(10, 80, 190, 1);

  // APP BAR
  Color appBarColor = const Color(0xFFFFFFFF);

  //BUTTONS

  Color primaryButtonColor = const Color.fromRGBO(10, 80, 190, 1);

  Color primaryInputBarOutline = Color.fromARGB(65, 0, 0, 0);
  Color primaryInputBarBackground = const Color.fromRGBO(245, 251, 252, 1);
}
