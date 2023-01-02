import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.all(4),
      height: 300,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          blurRadius: 10,
          offset: Offset.zero,
          color: Colors.black.withOpacity(0.1),
        )
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 180,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://sun9-54.userapi.com/impg/LKP1Bz-_YeipW4wlP3DdBZRA6al6sbVe1P67MA/UDxrTxjiXwI.jpg?size=604x390&quality=96&sign=0311b2afc2ec57ae217c14087f37c7d7&c_uniq_tag=li81-duY1NEG9DJOKj-EUOXZcEhJ8qQ9xQXq48SywxA&type=album'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Отдых в Пятигорске',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text('8/10 участников'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.place,
                  size: 18,
                  color: Colors.red,
                ),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    'Ворота любви  Канатная дорога  гора Машук  Эолова арфа  Озеро Провал Бесстыжие ванны ПКиО им. Кирова  Ужин в ресторане',
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
