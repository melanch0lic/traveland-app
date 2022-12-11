import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import '../../navigation/router.gr.dart';
import 'tabs_page_model.dart';

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
    return ChangeNotifierProvider(
      create: (context) => TabsPageViewModel(),
      child: Builder(builder: (context) {
        final currentRouterIndex = context.select((TabsPageViewModel model) => model.currentRouterIndex);
        return WillPopScope(
          onWillPop: () async {
            final isFirstRouteInCurrentTab = currentRouterIndex == 0;
            if (!isFirstRouteInCurrentTab) {
              if (context.read<InitializeProvider>().appRouter.current.path != '/home') {
                context.navigateTo(const HomeRouter());
                context.read<TabsPageViewModel>().changeRouterIndex(0);
                return false;
              }
            }
            return isFirstRouteInCurrentTab;
          },
          child: AutoTabsScaffold(
            routes: const [HomeRouter(), HotelsRouter(), MapRouter(), HubsRouter(), GuidesRouter()],
            bottomNavigationBuilder: (_, tabsRouter) {
              return BottomNavigationBar(
                elevation: 0,
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) {
                  tabsRouter.setActiveIndex(index);
                  context.read<TabsPageViewModel>().changeRouterIndex(index);
                },
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
          ),
        );
      }),
    );
  }
}
