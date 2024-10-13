import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

// news theme

ThemeData newsLightTheme ()=>  ThemeData(
  primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 25.0,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
 statusBarIconBrightness: Brightness.dark,
 statusBarColor: Colors.white,
 ),
 backgroundColor: Colors.white,
 elevation: 0.0,
 ),
 bottomNavigationBarTheme: BottomNavigationBarThemeData(
 type: BottomNavigationBarType.fixed,
 backgroundColor: Colors.white,
 elevation: 0.0,
 selectedItemColor: Colors.deepOrange,
 showUnselectedLabels: false,
 showSelectedLabels: false,
 unselectedItemColor: Colors.black,
 ),
 scaffoldBackgroundColor: Colors.white,
 );

ThemeData newsDarkTheme ()=>  ThemeData(
  primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 25.0,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: HexColor('333739'),
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    selectedItemColor: Colors.deepOrange,
    showUnselectedLabels: false,
    showSelectedLabels: false,
    unselectedItemColor: Colors.white,
  ),
  scaffoldBackgroundColor: HexColor('333739'),
);

// shop theme

ThemeData shopLightTheme ()=>  ThemeData(
  primarySwatch: Colors.green,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[99],
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  ),
  scaffoldBackgroundColor: Colors.grey[99],
  fontFamily: 'Quicksand'
);

ThemeData shopDarkTheme ()=>  ThemeData(

);