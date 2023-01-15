import 'package:flutter/material.dart';

import '../../data/network/models/entity/user_info_entity.dart';
import '../../domain/services/auth_service.dart';

class ProfilePageViewModel with ChangeNotifier {
  final AuthService authService;

  ProfilePageViewModel(this.authService) {
    init();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  late UserInfoEntity _userInfo;
  UserInfoEntity get userInfo => _userInfo;

  Future<void> init() async {
    _isLoading = true;
    notifyListeners();

    await fetchUserInfo();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchUserInfo() async {
    final response = await authService.getUserInfo();
    response.fold((result) {
      _userInfo = UserInfoEntity(
          lastName: result.result!.users!.lastName,
          mail: result.result!.users!.mail,
          name: result.result!.users!.name,
          number: result.result!.users!.number,
          roleId: result.result!.users!.roleId,
          sex: result.result!.users!.sex,
          userId: result.result!.users!.userId);
    }, (exception, error) {});
  }

  Future<void> onButtonExitPressed() async {
    await authService.logout();
  }
}
