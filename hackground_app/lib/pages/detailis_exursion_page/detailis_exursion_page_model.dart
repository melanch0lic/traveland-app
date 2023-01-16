import 'package:flutter/material.dart';

class DetailsExursionPageViewModel with ChangeNotifier {
  DetailsExursionPageViewModel();

  bool _isFullTextShowed = false;
  bool get isFullTextShowed => _isFullTextShowed;

  void onShowFullButtonPressed() {
    _isFullTextShowed = !_isFullTextShowed;
    notifyListeners();
  }
}
