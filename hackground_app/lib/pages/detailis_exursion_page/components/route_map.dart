import 'package:flutter/material.dart';

class RouteMap extends StatelessWidget {
  const RouteMap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          image: DecorationImage(
              image: AssetImage(
                'assets/images/map_alex.png',
              ),
              fit: BoxFit.cover),
        ));
  }
}
