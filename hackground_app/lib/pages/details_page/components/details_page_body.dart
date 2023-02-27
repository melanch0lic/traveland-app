import 'package:flutter/material.dart';
import '../../../domain/models/attraction_model.dart';

import '../../../data/network/models/entity/housing_entity.dart';
import '../../../unities.dart';

class DetailsPageBody extends StatelessWidget {
  final HousingEntity selectedModel;
  const DetailsPageBody({Key? key, required this.selectedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(selectedModel.placeInfo.name,
            style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
        Text(selectedModel.placeInfo.adress.value, style: const TextStyle(color: Units.mainYellow)),
        const SizedBox(height: 20),
        Text('Описание .................', style: TextStyle(color: Colors.white.withOpacity(0.7))),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Посмотреть отзывы',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Material(
                  color: Units.mainYellow,
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.black.withOpacity(0.1),
                    highlightColor: Colors.black.withOpacity(0.2),
                    child: Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                        child: const Text('Проложить маршрут',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
                  ),
                ))
          ],
        ),
      ]),
    );
  }
}
