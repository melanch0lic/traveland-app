import 'package:flutter/material.dart';

import '../widgets/tabs_bar_button.dart';
import '../pages/landing_page.dart';
import '../pages/house_rent_page.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final _pageController = PageController();

  void _changeSelectedPageIndex(int newIndex) {
    setState(() {
      _selectedPageIndex = newIndex;
      _pageController.jumpToPage(newIndex);
    });
  }

  final _bottomBarIcons = const [
    Icon(Icons.home),
    Icon(Icons.local_hotel),
    Icon(Icons.map),
    Icon(Icons.call_split),
    Icon(Icons.transfer_within_a_station),
  ];
  @override
  dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          LandingPage(),
          HousePage(),
        ],
        pageSnapping: false,
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            _bottomBarIcons.length,
            (index) => TabsBarButton(
              index: index,
              changeSelectedPageIndex: _changeSelectedPageIndex,
              selectedPageIndex: _selectedPageIndex,
              icon: _bottomBarIcons[index],
            ),
          ),
        ),
      ),
    );
  }
}
