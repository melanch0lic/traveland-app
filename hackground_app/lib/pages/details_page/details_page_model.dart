import 'package:flutter/material.dart';

class DetailsPageViewModel with ChangeNotifier {
  DetailsPageViewModel();

  bool _isFullTextShowed = false;
  bool get isFullTextShowed => _isFullTextShowed;

  void onShowFullButtonPressed() {
    _isFullTextShowed = !_isFullTextShowed;
    notifyListeners();
  }
}
