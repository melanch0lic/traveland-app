import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _jwtToken = 'jwt_token';
const _mail = 'mail';
const _password = 'password';

class SessionData {
  final FlutterSecureStorage _storage;
  const SessionData(this._storage);

  Future<String?> getJwtToken() => _storage.read(key: _jwtToken);

  Future<String?> getLogin() => _storage.read(key: _mail);

  Future<String?> getPassword() => _storage.read(key: _password);

  Future<void> saveJwtToken(String token, String mail, String password) async {
    await _storage.write(key: _jwtToken, value: token);
    await _storage.write(key: _mail, value: mail);
    await _storage.write(key: _password, value: password);
  }

  // static Future<void> saveBadToken() async {
  //   print('badTokenSaves)))))');
  //   await const FlutterSecureStorage().write(
  //       key: _jwtToken,
  //       value:
  //           'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMDBmNjE0YzAyYzAzNGFhZDY3OWNhMWY3ZjJjNDUzYyIsIm5hbWUiOjIwMCwiZXhwIjoxNjYyMDE2NDgwLCJpYXQiOjE2NjIwMTI4ODAsImlkIjoyMDAsImdpZCI6MX0.m2m1Q/SfAV2rouOC8hC4gfqPyX0CPMU/2p9RQ0dxKB0');
  // }

  Future<void> clearJwtToken() async {
    await _storage.delete(key: _jwtToken);
    await _storage.delete(key: _mail);
    await _storage.delete(key: _password);
  }
}
