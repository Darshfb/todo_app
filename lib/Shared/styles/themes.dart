import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark),
      titleTextStyle: TextStyle(
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: Colors.black)),
  primarySwatch: Colors.deepOrange,
  textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black)),
);


ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF333739),
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF333739),
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light),
      titleTextStyle: TextStyle(
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white)),
  primarySwatch: Colors.deepOrange,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    elevation: 20,
    backgroundColor: Color(0xFF333739),
  ),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.white)),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: const Color(0xFF333739),
  ),
);

//
// ThemeData(
// scaffoldBackgroundColor: Colors.white,
// appBarTheme: const AppBarTheme(
// backgroundColor: Colors.transparent,
// elevation: 0.0,
// centerTitle: true,
// systemOverlayStyle: SystemUiOverlayStyle(
// statusBarColor: Colors.white,
// statusBarIconBrightness: Brightness.dark,
// statusBarBrightness: Brightness.dark),
// titleTextStyle: TextStyle(
// color: Colors.deepOrange,
// fontWeight: FontWeight.bold,
// fontSize: 20.0,
// ),
// iconTheme: IconThemeData(color: Colors.black)),
// primarySwatch: Colors.deepOrange,
// textTheme: const TextTheme(
// bodyText1: TextStyle(
// fontSize: 18.0,
// fontWeight: FontWeight.w600,
// color: Colors.black)),
// )