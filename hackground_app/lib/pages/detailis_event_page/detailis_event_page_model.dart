import 'package:flutter/material.dart';

class DetailsEventPageViewModel with ChangeNotifier {
  DetailsEventPageViewModel();

  bool _isFullTextShowed = false;
  bool get isFullTextShowed => _isFullTextShowed;

  void onShowFullButtonPressed() {
    _isFullTextShowed = !_isFullTextShowed;
    notifyListeners();
  }
}
