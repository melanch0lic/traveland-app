import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

enum ButtonState { canSubmit, authProcess, disable }

class RegisterPageViewModel with ChangeNotifier {
  RegisterPageViewModel();

  String _password = '', _passwordRepeat = '', _mail = '';

  String get email => _mail;
  String get password => _password;
  String get passwordRepeat => _passwordRepeat;

  void onMailChange(String value) {
    if (_mail == value) return;
    _mail = value;
    changeButtonState();
    notifyListeners();
  }

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

  bool _isEmailCorrect = true;
  bool get isEmailCorrect => _isEmailCorrect;

  bool _isPasswordCorrect = true;
  bool get isPasswordCorrect => _isPasswordCorrect;

  bool _isPasswordRepeatCorrect = true;
  bool get isPasswordRepeatCorrect => _isPasswordRepeatCorrect;

  ButtonState authButtonState = ButtonState.disable;

  void changeButtonState() {
    if (_mail.isNotEmpty && _password.isNotEmpty && _passwordRepeat.isNotEmpty) {
      authButtonState = ButtonState.canSubmit;
    } else {
      authButtonState = ButtonState.disable;
    }
  }

  void changeHidePasswordMode() {
    _isHidePassword = !_isHidePassword;
    notifyListeners();
  }

  void changeHidePasswordRepeatMode() {
    _isHidePasswordRepeat = !_isHidePasswordRepeat;
    notifyListeners();
  }

  Future<bool> onRegisterButtonPressed() async {
    if (!EmailValidator.validate(_mail)) {
      _isEmailCorrect = false;
      notifyListeners();
      return false;
    } else {
      _isEmailCorrect = true;
      notifyListeners();
    }
    if (_password.length < 6 || _passwordRepeat.length < 6 || _password != _passwordRepeat) {
      _isPasswordCorrect = false;
      _isPasswordRepeatCorrect = false;
      notifyListeners();
      return false;
    } else {
      _isPasswordCorrect = true;
      _isPasswordRepeatCorrect = true;
      notifyListeners();
    }
    return true;
  }
}
