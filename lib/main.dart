import 'package:bmi_app/home.dart';
import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';

import 'SpalshScreen.dart';

void main() {
  runApp( BmiApp());
}

class BmiApp extends StatelessWidget {
   BmiApp({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySpalshScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black, // app bar color
        ),
          canvasColor: Colors.black ,// background color
        textTheme: TextTheme(
          headline3: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
          headline2: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: IconThemeData(color:Colors.purple),
      ),
    );
  }
}
/*
Color(0xFF4A148C)
Color(0xFF00BFA5)
 */