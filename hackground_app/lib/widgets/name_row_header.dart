import 'package:flutter/material.dart';

class NameRowHeader extends StatelessWidget {
  final String? name;
  final Widget? routeWidget;
  final Function? changeSelectedPageIndex;
  final int? index;

  NameRowHeader(
      {this.name, this.routeWidget, this.changeSelectedPageIndex, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
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
              onPressed: () {
                changeSelectedPageIndex!(index);
              },
              child: Text(
                'Больше',
                style: TextStyle(color: Colors.lightBlue),
              ))
        ],
      ),
    );
  }
}
