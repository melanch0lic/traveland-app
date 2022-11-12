import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Function? changeSelectedPageIndex;

  const CustomAppBar({this.changeSelectedPageIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Traveland',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          GestureDetector(
            onTap: () {
              changeSelectedPageIndex!(6);
            },
            child: const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://i.pinimg.com/564x/b9/66/07/b96607f27ab387f040ec0d854ab5167c.jpg'),
            ),
          )
        ],
      ),
    );
  }
}
