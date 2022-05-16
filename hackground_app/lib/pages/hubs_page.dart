import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/search_widget.dart';

class HubsPage extends StatelessWidget {
  final Function? changeIndex;

  const HubsPage(this.changeIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(changeSelectedPageIndex: changeIndex),
              SearchWidget(),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Хабы',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      child: const Text(
                        'Присоединиться',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue.withOpacity(0.1),
                                blurRadius: 10)
                          ]),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      child: const Text(
                        'Создать новый',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Общедоступные',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                padding: EdgeInsets.all(4),
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Отдых в Пятигорске',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
