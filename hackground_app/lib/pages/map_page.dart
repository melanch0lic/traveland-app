import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        child: Image.asset(
          'lib/assets/Karta.png',
          fit: BoxFit.cover,
        ),
      ),
    ]);
  }
}
