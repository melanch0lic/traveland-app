import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: [
        BoxShadow(
          blurRadius: 10,
          offset: Offset.zero,
          color: Colors.black.withOpacity(0.1),
        )
      ]),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage:
                    NetworkImage('https://i.pinimg.com/564x/b9/66/07/b96607f27ab387f040ec0d854ab5167c.jpg'),
                maxRadius: 40,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Александр Иванов',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 4),
                    Text('Дата регистрации 14.05.2022')
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              textUnderText('Маршруты', "4"),
              textUnderText('Достижения', "12"),
            ],
          )
        ],
      ),
    );
  }

  Column textUnderText(String text1, String text2) {
    return Column(
      children: [
        Text(
          text1,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 12),
        Text(
          text2,
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
