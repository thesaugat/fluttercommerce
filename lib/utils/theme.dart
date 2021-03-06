import 'package:ecom/utils/constants.dart';
import 'package:flutter/material.dart';

class ThemeUtils {
  static getLightTheme() {
    return ThemeData(
        primarySwatch: Colors.brown,
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: false,
            elevation: 1,
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
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.grey.shade900,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ));
  }
}
