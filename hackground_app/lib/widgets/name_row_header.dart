import 'package:flutter/material.dart';

class NameRowHeader extends StatelessWidget {
  final String? name;
  final Widget? routeWidget;
  final int? index;

  const NameRowHeader({Key? key, this.name, this.routeWidget, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Больше',
                style: TextStyle(color: Colors.lightBlue),
              ))
        ],
      ),
    );
  }
}
