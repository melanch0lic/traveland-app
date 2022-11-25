import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hackground_app/navigation/router.gr.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final _bottomBarIcons = const [
    Icon(Icons.home),
    Icon(Icons.local_hotel),
    Icon(Icons.map),
    Icon(Icons.people),
    Icon(Icons.transfer_within_a_station),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [HomeRouter(), HotelsRouter(), MapRouter(), HubsRouter(), GuidesRouter()],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          elevation: 0,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          unselectedIconTheme: const IconThemeData(color: Colors.black),
          selectedIconTheme: const IconThemeData(color: Colors.amberAccent, size: 30),
          items: [
            BottomNavigationBarItem(
              icon: _bottomBarIcons[0],
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _bottomBarIcons[1],
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _bottomBarIcons[2],
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _bottomBarIcons[3],
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _bottomBarIcons[4],
              label: '',
            ),
          ],
        );
      },
    );
  }
}
