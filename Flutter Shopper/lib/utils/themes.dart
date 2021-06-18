import "package:flutter/material.dart";
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: Theme.of(context).textTheme,
          iconTheme: IconThemeData(color: Colors.black)));

  static ThemeData darktheme(BuildContext context) => ThemeData(
        cardColor: Colors.black,
      );

  //Colors
  static Color cream = Color(0xfff5f5f5);
  static Color darkbluish = Color(0xff403b58);
  static Color darkCream = Vx.gray400;
  static Color darkPurple = Vx.purple400;

  // declaring your own custom color
}
