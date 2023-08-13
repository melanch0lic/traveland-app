import 'package:flutter/cupertino.dart';

class TabsPageViewModel with ChangeNotifier {
  PageController? _placesController;
  PageController? get placesController => _placesController;

  void init() {
    _placesController = PageController();
  }

  TabsPageViewModel() {
    init();
  }

  int _currentRouterIndex = 0;
  int get currentRouterIndex => _currentRouterIndex;

  void changeRouterIndex(int index) {
    _currentRouterIndex = index;
    notifyListeners();
  }
}
