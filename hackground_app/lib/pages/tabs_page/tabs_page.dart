import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  final _bottomBarIcons = [
    SvgPicture.asset(
      'assets/images/home_icon.svg',
      width: 22,
      height: 25,
    ),
    SvgPicture.asset(
      'assets/images/hotels_icon.svg',
      width: 22,
      height: 25,
    ),
    SvgPicture.asset(
      'assets/images/map_icon.svg',
      width: 22,
      height: 25,
    ),
    SvgPicture.asset(
      'assets/images/tours_icon.svg',
      width: 22,
      height: 25,
    ),
    SvgPicture.asset(
      'assets/images/profile_icon.svg',
      width: 22,
      height: 25,
    ),
  ];

  final _bottomBarActiveIcons = [
    SvgPicture.asset(
      'assets/images/home_icon_filled.svg',
      width: 22,
      height: 25,
    ),
    SvgPicture.asset(
      'assets/images/hotels_icon_filled.svg',
      width: 22,
      height: 25,
    ),
    SvgPicture.asset(
      'assets/images/map_icon_filled.svg',
      width: 22,
      height: 25,
    ),
    SvgPicture.asset(
      'assets/images/tours_icon_filled.svg',
      width: 22,
      height: 25,
    ),
    SvgPicture.asset(
      'assets/images/profile_icon_filled.svg',
      width: 22,
      height: 25,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TabsPageViewModel(),
      child: Builder(builder: (context) {
        final theme = Theme.of(context);
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
            routes: const [HomeRouter(), HotelsRouter(), MapRouter(), PlacesRouter(), GuidesRouter()],
            bottomNavigationBuilder: (_, tabsRouter) {
              return BottomNavigationBar(
                backgroundColor: theme.bottomAppBarColor,
                elevation: 0,
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) {
                  tabsRouter.setActiveIndex(index);
                  context.read<TabsPageViewModel>().changeRouterIndex(index);
                },
                unselectedIconTheme: const IconThemeData(color: Colors.black),
                selectedIconTheme: const IconThemeData(color: Colors.amberAccent, size: 30),
                showSelectedLabels: false,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: _bottomBarIcons[0],
                    activeIcon: _bottomBarActiveIcons[0],
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: _bottomBarIcons[1],
                    activeIcon: _bottomBarActiveIcons[1],
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: _bottomBarIcons[2],
                    activeIcon: _bottomBarActiveIcons[2],
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: _bottomBarIcons[3],
                    activeIcon: _bottomBarActiveIcons[3],
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: _bottomBarIcons[4],
                    activeIcon: _bottomBarActiveIcons[4],
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
