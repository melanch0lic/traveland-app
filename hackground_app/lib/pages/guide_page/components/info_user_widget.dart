import 'package:flutter/material.dart';

class InfoUserWidget extends StatelessWidget {
  const InfoUserWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 25),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 24,
              offset: Offset.fromDirection(0, 8),
              color: Color.fromRGBO(149, 157, 165, 0.2),
            )
          ]),
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(bottom: 8),
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 1),
            shape: BoxShape.circle,
          ),
        ),
        Text(
          'Георгий Тебиев',
          style: Theme.of(context).textTheme.headline2?.copyWith(
                color: const Color.fromRGBO(44, 44, 46, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 5),
        Text(
          'example@gmail.com',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: const Color.fromRGBO(44, 44, 46, 1),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
        ),
      ]),
    );
  }
}
