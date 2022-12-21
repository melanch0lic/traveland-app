import 'package:flutter/material.dart';

enum ThemeModeType { light, dark }

class AppTheme with ChangeNotifier {
  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color.fromRGBO(234, 234, 235, 1),
        bottomAppBarColor: const Color.fromRGBO(242, 242, 247, 1),
        primaryColorLight: const Color.fromRGBO(255, 255, 255, 1),
        primaryColorDark: const Color.fromRGBO(44, 44, 46, 1),
        cardColor: const Color.fromRGBO(253, 197, 0, 1),
        canvasColor: const Color.fromRGBO(255, 162, 0, 1),
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.11),
        selectedRowColor: const Color.fromRGBO(37, 65, 178, 0.2),
        indicatorColor: const Color.fromRGBO(37, 65, 178, 1),
        highlightColor: const Color.fromRGBO(30, 53, 144, 1),
        unselectedWidgetColor: const Color.fromRGBO(0, 125, 255, 1),
        primaryIconTheme: const IconThemeData(
          color: Color.fromRGBO(37, 65, 178, 1),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'Rubik', color: Color.fromRGBO(255, 255, 255, 1), fontSize: 28, fontWeight: FontWeight.w700),
          headline2: TextStyle(fontFamily: 'Rubik', fontSize: 18, fontWeight: FontWeight.w900),
          bodyText1: TextStyle(
            fontFamily: 'Rubik',
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 16,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Rubik',
            color: Color.fromRGBO(99, 99, 102, 1),
          ),
        ),
        dividerColor: const Color.fromRGBO(0, 0, 0, 0.4),
      );
}
