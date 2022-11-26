import 'package:flutter/material.dart';

enum ThemeModeType { light, dark }

class AppTheme with ChangeNotifier {
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        bottomAppBarColor: const Color.fromRGBO(0, 0, 0, 1),
        cardColor: const Color.fromRGBO(23, 23, 23, 1),
        shadowColor: const Color.fromRGBO(0, 0, 0, 0),
        selectedRowColor: const Color.fromRGBO(23, 23, 23, 1),
        indicatorColor: const Color.fromRGBO(255, 255, 255, 1),
        highlightColor: const Color.fromRGBO(35, 210, 137, 1),
        unselectedWidgetColor: const Color.fromRGBO(0, 125, 255, 1),
        primaryIconTheme: const IconThemeData(
          color: Color.fromRGBO(238, 238, 238, 1),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'Geometria',
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 16,
              fontWeight: FontWeight.w800),
          headline2: TextStyle(fontFamily: 'Geometria', fontSize: 16, fontWeight: FontWeight.w800),
          headline3: TextStyle(
              fontFamily: 'Geometria', fontSize: 16, fontWeight: FontWeight.w800, color: Color.fromRGBO(0, 0, 0, 1)),
          bodyText1: TextStyle(
            fontFamily: 'PTRootUI',
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 12,
          ),
          bodyText2: TextStyle(
            fontFamily: 'PTRootUI',
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        dividerColor: const Color.fromRGBO(255, 255, 255, 1),
      );

  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color.fromRGBO(238, 238, 238, 1),
        bottomAppBarColor: const Color.fromRGBO(255, 255, 255, 1),
        cardColor: const Color.fromRGBO(255, 255, 255, 1),
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.11),
        selectedRowColor: const Color.fromRGBO(238, 238, 238, 1),
        indicatorColor: const Color.fromARGB(255, 0, 0, 0),
        highlightColor: const Color.fromRGBO(35, 210, 137, 1),
        unselectedWidgetColor: const Color.fromRGBO(0, 125, 255, 1),
        primaryIconTheme: const IconThemeData(
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'Geometria',
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 16,
              fontWeight: FontWeight.w800),
          headline2: TextStyle(fontFamily: 'Geometria', fontSize: 16, fontWeight: FontWeight.w800),
          headline3: TextStyle(
              fontFamily: 'Geometria',
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(238, 238, 238, 1)),
          bodyText1: TextStyle(
            fontFamily: 'PTRootUI',
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 12,
          ),
          bodyText2: TextStyle(
            fontFamily: 'PTRootUI',
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        dividerColor: const Color.fromRGBO(0, 0, 0, 0.4),
      );
}
