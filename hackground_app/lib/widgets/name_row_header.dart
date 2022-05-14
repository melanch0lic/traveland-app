import 'package:flutter/material.dart';

class NameRowHeader extends StatelessWidget {
  final String? name;
  final Widget? routeWidget;

  NameRowHeader({this.name, this.routeWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'Больше',
                style: TextStyle(color: Colors.lightBlue),
              ))
        ],
      ),
    );
  }
}
