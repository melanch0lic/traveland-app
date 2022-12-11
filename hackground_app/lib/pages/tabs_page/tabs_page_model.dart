import 'package:flutter/cupertino.dart';

class TabsPageViewModel with ChangeNotifier {
  int _currentRouterIndex = 0;
  int get currentRouterIndex => _currentRouterIndex;

  //  String _currentPath = '/home';
  // String get currentPath => _currentPath;

  void changeRouterIndex(int index) {
    _currentRouterIndex = index;
    notifyListeners();
  }
}
