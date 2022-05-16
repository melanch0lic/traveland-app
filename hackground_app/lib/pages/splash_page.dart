import 'package:flutter/material.dart';

import '../unities.dart';
import '../pages/tabs_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(seconds: 2),
        () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => TabsScreen())));
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Units.primaryGray,
              Units.secondaryGray,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
        ),
        const Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.public_outlined,
            color: Colors.white,
            size: 100,
          ),
        )
      ],
    );
  }
}
