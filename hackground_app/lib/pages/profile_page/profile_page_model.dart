import 'package:flutter/material.dart';

import '../../domain/services/auth_service.dart';

class ProfilePageViewModel with ChangeNotifier {
  final AuthService authService;

  ProfilePageViewModel(this.authService);

  Future<void> onButtonExitPressed() async {
    await authService.logout();
  }
}
