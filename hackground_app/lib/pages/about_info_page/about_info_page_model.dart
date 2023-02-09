import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/network/models/register_request_body.dart';
import '../../domain/services/auth_service.dart';

enum ButtonState { canSubmit, authProcess, disable }

class AboutInfoPageViewModel with ChangeNotifier {
  AboutInfoPageViewModel({required this.authService, required this.email, required this.password});

  AuthService authService;

  final String email, password;

  String _name = '', _sex = '';

  String _authErrorTitle = '';
  String get authErrorTitle => _authErrorTitle;

  bool _isRegisterInProcess = false;
  bool get isRegisterInProcess => _isRegisterInProcess;

  void onNameChange(String value) {
    if (_name == value) return;
    _name = value;
    changeButtonState();
    notifyListeners();
  }

  void onSexChange(String value) {
    if (_sex == value) return;
    _sex = value;
    changeButtonState();
    notifyListeners();
  }

  bool _isNameCorrect = true;
  bool get isNameCorrect => _isNameCorrect;

  bool _isSexCorrect = true;
  bool get isSexCorrect => _isSexCorrect;

  ButtonState authButtonState = ButtonState.disable;

  void changeButtonState() {
    if (_isRegisterInProcess) {
      authButtonState = ButtonState.authProcess;
    } else if (_name.isNotEmpty && _sex.isNotEmpty) {
      authButtonState = ButtonState.canSubmit;
    } else {
      authButtonState = ButtonState.disable;
    }
  }

  bool _checkError(DioError exception) => exception.error is SocketException;

  Future<bool> onSentInfoButtonPressed() async {
    _authErrorTitle = '';
    _isRegisterInProcess = true;
    changeButtonState();
    notifyListeners();

    if (_name == '') {
      _isNameCorrect = false;
      notifyListeners();
      return false;
    } else {
      _isNameCorrect = true;
      notifyListeners();
    }
    if (_sex == 'None') {
      _isSexCorrect = false;
      notifyListeners();
      return false;
    } else {
      _isSexCorrect = true;
      notifyListeners();
    }
    bool result = true;
    final registerResult = await authService.register(RegisterRequestBody(
        name: _name, roleId: 1, mail: email, password: password, sex: _sex == 'Male' ? true : false));
    registerResult.fold((result) {}, (exception, error) {
      _authErrorTitle = _checkError(exception as DioError)
          ? 'Нет подключения к интернету...'
          : 'Пользователь с таким email уже сущетвует';
      _isRegisterInProcess = false;
      changeButtonState();
      result = false;
    });
    notifyListeners();
    return result;
  }
}
