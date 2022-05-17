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
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            ),
          )
        ],
      ),
    );
  }
}
