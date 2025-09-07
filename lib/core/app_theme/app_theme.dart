import 'package:flutter/material.dart';

const Color lightPrimaryColor = Color.fromARGB(255, 211, 196, 169);
const Color primaryColor = Color.fromARGB(255, 214, 139, 0);
const Color darkPrimaryColor = Color.fromARGB(255, 97, 63, 0);
const Color darkColor = Color.fromARGB(255, 26, 17, 0);
const Color lightColor = Color.fromARGB(255, 240, 235, 215);
const Color greyColor = Color(0xFF919191);

enum MyThemes {
  light("Light"),
  dark("Dark");

  const MyThemes(this.name);
  final String? name;
}

final myThemeData = {
  // light theme
  MyThemes.light: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      drawerTheme: const DrawerThemeData(
          backgroundColor: lightColor, surfaceTintColor: lightColor),

      //theme of button
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(color: lightColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: primaryColor,
              foregroundColor: lightColor)),
      primaryColor: primaryColor,

      //theme of text
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: darkPrimaryColor,
              fontSize: 28,
              fontWeight: FontWeight.w900,
              fontFamily: "vip"),
          titleMedium: TextStyle(
              color: darkPrimaryColor,
              fontSize: 23,
              fontWeight: FontWeight.w800,
              fontFamily: "vip"),
          titleSmall: TextStyle(
              color: darkPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: "vip"),
          displayLarge: TextStyle(
              color: darkPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: "vip"),
          displayMedium: TextStyle(
              color: darkPrimaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              fontFamily: "vip"),
          displaySmall: TextStyle(
              color: darkPrimaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w200,
              fontFamily: "vip")),

      //theme of appbar
      appBarTheme: const AppBarTheme(backgroundColor: lightColor),
      scaffoldBackgroundColor: lightColor,

      //theme of icon
      iconTheme: const IconThemeData(color: primaryColor),
      navigationBarTheme: const NavigationBarThemeData(
        indicatorColor: primaryColor,
        shadowColor: primaryColor,
        surfaceTintColor: primaryColor,
        backgroundColor: primaryColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedIconTheme: IconThemeData(
            fill: 1,
          ),
          unselectedItemColor: primaryColor,
          elevation: 2,
          backgroundColor: lightColor),
      canvasColor: lightColor,

      //theme of field
      inputDecorationTheme: const InputDecorationTheme(
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: greyColor),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: darkPrimaryColor),
              borderRadius: BorderRadius.all(Radius.circular(12)))),
      dividerTheme: const DividerThemeData(color: greyColor, thickness: 1)),

  // dark theme
  MyThemes.dark: ThemeData(
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark, seedColor: darkPrimaryColor),

    drawerTheme: const DrawerThemeData(
        backgroundColor: darkPrimaryColor, surfaceTintColor: darkPrimaryColor),

    //theme of button
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(color: lightColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: primaryColor,
    )),

    primaryColor: primaryColor,

    navigationBarTheme: const NavigationBarThemeData(
      elevation: 2,
      shadowColor: lightColor,
      surfaceTintColor: darkPrimaryColor,
      backgroundColor: darkPrimaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 2, backgroundColor: darkPrimaryColor),
    canvasColor: darkPrimaryColor,
    //theme of text
    textTheme: const TextTheme(
        titleLarge: TextStyle(
            color: lightColor,
            fontSize: 28,
            fontWeight: FontWeight.w900,
            fontFamily: "vip"),
        titleMedium: TextStyle(
            color: lightColor,
            fontSize: 23,
            fontWeight: FontWeight.w800,
            fontFamily: "vip"),
        titleSmall: TextStyle(
            color: lightColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: "vip"),
        displayLarge: TextStyle(
            color: lightColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: "vip"),
        displayMedium: TextStyle(
            color: lightColor,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            fontFamily: "vip"),
        displaySmall: TextStyle(
            color: lightColor,
            fontSize: 12,
            fontWeight: FontWeight.w200,
            fontFamily: "vip")),

    //theme of appbar
    appBarTheme: const AppBarTheme(backgroundColor: darkPrimaryColor),
    scaffoldBackgroundColor: darkPrimaryColor,

    //theme of icon
    iconTheme: const IconThemeData(color: primaryColor),

    //theme of field
    inputDecorationTheme: const InputDecorationTheme(

        // filled: true,
        // fillColor: darkColor,

        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: lightColor),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(12)))),
    dividerTheme: const DividerThemeData(color: greyColor, thickness: 1),
  ),
};
