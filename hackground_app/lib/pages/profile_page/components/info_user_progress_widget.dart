import 'package:flutter/material.dart';

class InfoUserProgressWidget extends StatelessWidget {
  const InfoUserProgressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 25, left: 50, right: 50),
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 24,
              offset: Offset.fromDirection(0, 8),
              color: const Color.fromRGBO(149, 157, 165, 0.2),
            )
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Маршруты',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: const Color.fromRGBO(44, 44, 46, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              '5',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: const Color.fromRGBO(44, 44, 46, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Достижения',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: const Color.fromRGBO(44, 44, 46, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              '12',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: const Color.fromRGBO(44, 44, 46, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        )
      ]),
    );
  }
}
