import 'package:flutter/material.dart';

class MapCategorySelectWidget extends StatelessWidget {
  const MapCategorySelectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.black.withOpacity(0.6),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          ),
          child: const Text('Кафе'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.black.withOpacity(0.6),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          ),
          child: const Text('Кино'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.black.withOpacity(0.6),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          ),
          child: const Text('Аптека'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.black.withOpacity(0.6),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          ),
          child: const Text('Отель'),
        )
      ],
    );
  }
}
