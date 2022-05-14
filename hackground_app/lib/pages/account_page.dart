import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Traveland',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings, color: Colors.black, size: 30))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
