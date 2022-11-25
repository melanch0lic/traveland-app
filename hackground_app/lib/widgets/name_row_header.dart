import 'package:flutter/material.dart';
import 'package:hackground_app/navigation/router.gr.dart';
import 'package:auto_route/auto_route.dart';

class NameRowHeader extends StatelessWidget {
  final String? name;

  const NameRowHeader({
    Key? key,
    this.name,
  }) : super(key: key);

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
              onPressed: () {
                context.navigateTo(const HotelsRouter());
              },
              child: const Text(
                'Больше',
                style: TextStyle(color: Colors.lightBlue),
              ))
        ],
      ),
    );
  }
}
