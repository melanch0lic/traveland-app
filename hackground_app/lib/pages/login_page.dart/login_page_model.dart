import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/network/models/login_request_body.dart';
import '../../domain/services/auth_service.dart';

enum ButtonState { canSubmit, authProcess, disable }

class LoginPageViewModel extends ChangeNotifier {
  final AuthService authService;

  LoginPageViewModel({required this.authService});

  String _authErrorTitle = '';
  String get authErrorTitle => _authErrorTitle;

  bool get isDataCorrect => _authErrorTitle == '';

  String _mail = '', _password = '';
  bool _isAuthInProcess = false;

  bool _isHidePassword = true;
  bool get isHidePassword => _isHidePassword;

  bool _isRememberUser = true;
  bool get isRememberUser => _isRememberUser;

  ButtonState authButtonState = ButtonState.disable;

  void changeRememberUserMode() {
    _isRememberUser = !_isRememberUser;
    notifyListeners();
  }

  void changeButtonState() {
    if (_isAuthInProcess) {
      authButtonState = ButtonState.authProcess;
    } else if (_mail.isNotEmpty && _password.isNotEmpty) {
      authButtonState = ButtonState.canSubmit;
    } else {
      authButtonState = ButtonState.disable;
    }
  }

  void changeHidePasswordMode() {
    _isHidePassword = !_isHidePassword;
    notifyListeners();
  }

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

  bool _checkError(DioError exception) => exception.error is SocketException;

  Future<bool> onAuthButtonPressed() async {
    _authErrorTitle = '';
    _isAuthInProcess = true;
    changeButtonState();
    notifyListeners();

    final loginResult = await authService.login(LoginRequestBody(mail: _mail, password: _password), isRememberUser);
    bool result = true;
    loginResult.fold(
      (result) {},
      (exception, error) {
        _authErrorTitle =
            _checkError(exception as DioError) ? 'Нет подключения к интернету...' : 'Неправильный логин или пароль';
        _isAuthInProcess = false;
        changeButtonState();
        result = false;
      },
    );
    notifyListeners();
    return result;
  }
}
