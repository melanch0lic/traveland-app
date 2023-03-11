import 'package:flutter/material.dart';

class DetailsHousingPageViewModel with ChangeNotifier {
  DetailsHousingPageViewModel();

  bool _isFullTextShowed = false;
  bool get isFullTextShowed => _isFullTextShowed;

  void onShowFullButtonPressed() {
    _isFullTextShowed = !_isFullTextShowed;
    notifyListeners();
  }
}
