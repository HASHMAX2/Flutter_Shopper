import 'package:codepur/pages/ActualHomePage.dart';
import 'package:codepur/pages/homepage.dart';
import 'package:codepur/utils/Routes.dart';
import 'package:flutter/material.dart';
import 'pages/LoginPage.dart';
import "utils/themes.dart";
import 'pages/CartPage.dart';

//import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lighttheme(context),
      debugShowCheckedModeBanner: false,
      //home: Homepage(),
      //initialRoute: MyRoutes.LoginRoute,
      routes: {
        "/": (context) => ActualHomePage(),
        MyRoutes.ActualHomePage: (context) => ActualHomePage(),
        MyRoutes.LoginRoute: (context) => LoginPage(),
        MyRoutes.CartRoute: (context) => CartPage()
      },
    );
  }
}
