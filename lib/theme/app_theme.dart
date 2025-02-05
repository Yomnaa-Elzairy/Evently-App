import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = Color(0xff5669FF);
  static Color white = Colors.white;
  static Color black = Colors.black;
  static TextTheme textTheme = TextTheme(
    headlineSmall:
        TextStyle(color: white, fontSize: 24, fontWeight: FontWeight.w400),
    titleLarge:
        TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w500),
    titleMedium:
        TextStyle(color: primary, fontSize: 16, fontWeight: FontWeight.w400),
    titleSmall:
        TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500),
  );
  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffF2FEFF),
          elevation: 0,
          titleTextStyle: textTheme.titleLarge!.copyWith(color: primary),
          centerTitle: true,
          iconTheme: IconThemeData(color: primary)),
      scaffoldBackgroundColor: Color(0xffF2FEFF),
      primaryColor: primary,
      textTheme: TextTheme(
          headlineSmall: TextStyle(
              color: white, fontSize: 24, fontWeight: FontWeight.w400),
          titleLarge: TextStyle(
              color: white, fontSize: 20, fontWeight: FontWeight.w500),
          titleMedium: TextStyle(
              color: white, fontSize: 16, fontWeight: FontWeight.w500),
          titleSmall: TextStyle(
              color: white, fontSize: 14, fontWeight: FontWeight.w500)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primary,
          selectedItemColor: white,
          unselectedItemColor: white,
          type: BottomNavigationBarType.fixed),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: white,
        shape: CircleBorder(side: BorderSide(width: 5, color: white)),
        iconSize: 35,
      ));
}
