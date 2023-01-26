import 'package:shared_preferences/shared_preferences.dart';

const _isRememberUser = 'isRememberUser';

class Settings {
  final SharedPreferences _storage;

  Settings(this._storage);

  bool? get getRememberUserMode => _storage.getBool(_isRememberUser);
  Future<void> saveRememberUserMode(bool isRememberUser) async {
    await _storage.setBool(_isRememberUser, isRememberUser);
  }

  Future<void> storageClear() async {
    await _storage.clear();
  }
}
