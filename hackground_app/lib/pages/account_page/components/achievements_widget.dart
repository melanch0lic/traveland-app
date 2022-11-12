import 'package:flutter/material.dart';

class AchievementsWidget extends StatelessWidget {
  const AchievementsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8, top: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: [
        BoxShadow(
          blurRadius: 10,
          offset: Offset.zero,
          color: Colors.black.withOpacity(0.1),
        )
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Достижения',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              4,
              (index) => const CircleAvatar(
                backgroundImage:
                    NetworkImage('https://i.pinimg.com/564x/31/bb/85/31bb85fcb437bc474c13d9308a19a38c.jpg'),
                maxRadius: 30,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [TextButton(onPressed: () {}, child: const Text('Больше'))],
          )
        ],
      ),
    );
  }
}
