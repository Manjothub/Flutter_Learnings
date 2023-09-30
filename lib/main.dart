import 'package:flutter/material.dart';
import 'package:flutter_basics/pages/home_page.dart';
import 'package:flutter_basics/pages/login_page.dart';
import 'package:flutter_basics/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(primarySwatch: Colors.green,
      fontFamily: GoogleFonts.lato().fontFamily,
      primaryTextTheme: GoogleFonts.latoTextTheme()
      ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark
      // ),
      initialRoute: "/login",
      routes: {
        "/": (context)=> LoginPage(),
        MyRoutes.homeRoute:(context) =>Homepage(),
        MyRoutes.loginRoute:(context) => LoginPage()
      },
    );
  }
}