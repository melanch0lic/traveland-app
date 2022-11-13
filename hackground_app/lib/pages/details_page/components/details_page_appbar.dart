import 'package:flutter/material.dart';

import '../../../unities.dart';

class DetailsPageAppbar extends StatelessWidget {
  const DetailsPageAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Units.mainYellow),
        title: Center(
          child: Icon(Icons.home, color: Units.mainYellow),
        ),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(icon: Icon(Icons.favorite, color: Units.mainYellow), onPressed: () {}))
        ]);
  }
}
