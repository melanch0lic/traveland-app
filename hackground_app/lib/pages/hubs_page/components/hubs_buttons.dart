import 'package:flutter/material.dart';

class HubsButtons extends StatelessWidget {
  const HubsButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFF6198FF), Color(0xFF216FFF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: Offset.zero,
                    color: Colors.black.withOpacity(0.1),
                  )
                ]),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: const Text(
              'Присоединиться',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.1), blurRadius: 10)]),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: const Text(
              'Создать новый',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}
