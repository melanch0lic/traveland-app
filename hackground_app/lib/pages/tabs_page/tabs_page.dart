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
    Icon(
      Icons.home,
    ),
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
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(icon: _bottomBarIcons[0], label: 'Home', backgroundColor: Colors.indigo),
            BottomNavigationBarItem(icon: _bottomBarIcons[1], label: 'Hotels', backgroundColor: Colors.indigo),
            BottomNavigationBarItem(icon: _bottomBarIcons[2], label: 'Map', backgroundColor: Colors.indigo),
            BottomNavigationBarItem(icon: _bottomBarIcons[3], label: 'Hubs', backgroundColor: Colors.indigo),
            BottomNavigationBarItem(icon: _bottomBarIcons[4], label: 'Guides', backgroundColor: Colors.indigo),
          ],
        );
      },
    );
    // return Scaffold(
    //   body: PageView(
    //     physics: const NeverScrollableScrollPhysics(),
    //     controller: _pageController,
    //     children: const [
    //       HomePage(),
    //       HotelsPage(),
    //       MapPage(),
    //       HubsPage(),
    //       GuidePage(),
    //       AccountPage(),
    //     ],
    //     pageSnapping: false,
    //   ),
    //   bottomNavigationBar: BottomAppBar(
    //     elevation: 10,
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: List.generate(
    //         _bottomBarIcons.length,
    //         (index) => TabsBarButton(
    //           index: index,
    //           changeSelectedPageIndex: _changeSelectedPageIndex,
    //           selectedPageIndex: _selectedPageIndex,
    //           icon: _bottomBarIcons[index],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
