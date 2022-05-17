import 'package:flutter/material.dart';

import '../unities.dart';
import '../pages/tabs_page.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController? earthController;
  Animation<double>? rotationAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    earthController =
        AnimationController(duration: const Duration(seconds: 4), vsync: this)
          ..repeat();

    rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: earthController!, curve: Curves.linear));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    earthController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(seconds: 4),
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
        RotationTransition(
          turns: rotationAnimation!,
          child: const Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.public,
              color: Colors.white,
              size: 100,
            ),
          ),
        )
      ],
    );
  }
}
