
import 'package:flutter/material.dart';

class ThemeDefault {
  //final Color btnTextColor=Colors.blue[400];

  final Color colorRequired=Colors.red;
  final Color colorGreen=Color(0xFF43A047);//ff é usado para indicar que é sem transparencia
  final Color colorText=Color(0xFF252d2f);
  final Color colorUttiliText=Color(0xFF252d2f);
  final Color colorUttiliBlue=Color(0xFF0b9dbc);
  final Color colorUttiliBlueDark=Color(0xFF0c7389);
  final Color colorUttiliBluePressed=Color(0xFF128da7);
  final Color colorUttiliBackAlmostWhite=Color(0xFFE1E6E9);
  final Color colorUttiliEmailSentBackColor=Color(0xFF587178);
  final Color colorUttiliYellow=Color(0xFFffcb08);
  final Color colorUttiliYellowPressed=Color(0xFFe5b70b);
  final Color colorUttiliBtnYelloText=Color(0xFF0c7389);
  final Color colorUttiliGray=Color(0xFFdfe4e4);
  final Color colorUttiliGrayText=Color(0xFF7A8E92);
  final Color colorUttiliOrange=Color(0xFFF67C00);
  final Color colorUttiliGrayButton=Color(0xFF72888e);
  final Color colorUttiliGrayButtonPressed=Color(0xFF616a6c);
  static final Color colorBackground=Colors.blueGrey[100];
  static final Color colorSaberLab=Colors.indigo[400];


  get theme {
    //final originalTextTheme = new ThemeData.dark().textTheme;
    //final originalBody1 = originalTextTheme.body1;
    //final drawerBackgroundColor=Color(0xFF1c8aa1);


    return new ThemeData(
        primaryColor: Colors.indigo[400],
        //        primaryColor: Colors.blue,//precisa do ff para indicar que é sem transparencia
        //        accentColor: Colors.orange[500],
        //        buttonColor: Color(0xFF0b9dbc),
        //        textSelectionColor: Colors.cyan[100],
        //hintColor: Colors.white,
        //cursorColor: Colors.white,
        //indicatorColor: Colors.white,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurple,     //  <-- dark color
          textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
        ),
        backgroundColor: Colors.grey[800]);
  }
}