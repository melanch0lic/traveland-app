import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Function? changeSelectedPageIndex;

  CustomAppBar({this.changeSelectedPageIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Traveland',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
          ),
          GestureDetector(
            onTap: () {
              changeSelectedPageIndex!(6);
            },
            child: CircleAvatar(
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
