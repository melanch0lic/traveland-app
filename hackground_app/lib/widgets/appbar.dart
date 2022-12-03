import 'package:flutter/material.dart';
import 'package:hackground_app/pages/account_page/account_page.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

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
              Navigator.of(context, rootNavigator: true)
                  .push(MaterialPageRoute(builder: ((context) => const AccountPage())));
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
