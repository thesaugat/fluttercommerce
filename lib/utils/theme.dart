import 'package:ecom/utils/constants.dart';
import 'package:flutter/material.dart';

class ThemeUtils {
  static getLightTheme() {
    return ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
            centerTitle: false,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
                color: kPrimaryTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            toolbarTextStyle: TextStyle(
              color: kPrimaryTextColor,
            )));
  }

  static getDarkTheme() {
    return ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade900,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ));
  }
}
