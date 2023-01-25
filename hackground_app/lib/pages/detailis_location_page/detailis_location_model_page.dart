import 'package:flutter/material.dart';

class DetailsLocationPageViewModel with ChangeNotifier {
  DetailsLocationPageViewModel();

  bool _isFullTextShowed = false;
  bool get isFullTextShowed => _isFullTextShowed;

  void onShowFullButtonPressed() {
    _isFullTextShowed = !_isFullTextShowed;
    notifyListeners();
  }
}
