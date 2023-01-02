import 'package:flutter/material.dart';

class HotelsPageViewModel with ChangeNotifier {
  HotelsPageViewModel();

  bool _sortFlag = false;
  bool get sortFlag => _sortFlag;

  void onSortFlagPressed() {
    _sortFlag = !_sortFlag;
    notifyListeners();
  }
}
