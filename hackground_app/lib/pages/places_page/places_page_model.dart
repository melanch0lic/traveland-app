import 'package:flutter/material.dart';

class PlacesPageViewModel with ChangeNotifier {
  PageController? _controller;
  PageController? get controller => _controller;

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  PlacesPageViewModel() {
    _controller = PageController();
  }

  bool _sortFlag = false;
  bool get sortFlag => _sortFlag;

  void onSortFlagPressed() {
    _sortFlag = !_sortFlag;
    notifyListeners();
  }

  void onPageChanged(int page) {
    _pageIndex = page;
    notifyListeners();
  }
}
