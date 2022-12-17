import 'package:flutter/material.dart';

enum ButtonState { canSubmit, authProcess, disable }

class RegisterPageViewModel with ChangeNotifier {
  RegisterPageViewModel();

  String _password = '', _passwordRepeat = '';

  void onPasswordChange(String value) {
    if (_password == value) return;
    _password = value;
    changeButtonState();
    notifyListeners();
  }

  void onPasswordRepeatChange(String value) {
    if (_passwordRepeat == value) return;
    _passwordRepeat = value;
    changeButtonState();
    notifyListeners();
  }

  bool _isHidePassword = true;
  bool get isHidePassword => _isHidePassword;

  bool _isHidePasswordRepeat = true;
  bool get isHidePasswordRepeat => _isHidePasswordRepeat;

  void changeButtonState() {}

  void changeHidePasswordMode() {
    _isHidePassword = !_isHidePassword;
    notifyListeners();
  }

  void changeHidePasswordRepeatMode() {
    _isHidePasswordRepeat = !_isHidePasswordRepeat;
    notifyListeners();
  }
}
