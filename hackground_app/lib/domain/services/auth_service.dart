import '../../data/network/main_api_client.dart';
import '../../data/network/models/login_request_body.dart';
import '../../data/network/models/register_request_body.dart';
import '../../data/network/models/response/login_response.dart';
import '../../data/network/models/response/register_response.dart';
import '../../data/network/models/response/user_by_id_response.dart';
import '../../data/network/result.dart';
import '../../data/network/session_data.dart';
import '../settings.dart';

class AuthService {
  final SessionData sessionData;
  final MainApiClient mainApiClient;
  final Settings settings;

  AuthService({required this.sessionData, required this.mainApiClient, required this.settings});

  Future<bool> isUserAuthorized() async {
    final jwtToken = await sessionData.getJwtToken();
    return jwtToken != null;
  }

  Future<Result<LoginResponse>> login(LoginRequestBody body, bool isRememberUser) async {
    final response = await mainApiClient.login(body);

    if (response.isSuccess()) {
      final success = response as Success;
      await sessionData.saveUserData(success.value.result.token, body.mail, body.password);
      await settings.saveRememberUserMode(isRememberUser);
    }
    return response;
  }

  Future<Result<RegisterResponse>> register(RegisterRequestBody body) async {
    final response = await mainApiClient.registerUser(body);

    if (response.isSuccess()) {
      final success = response as Success;
      await sessionData.saveUserData(success.value.result.token, body.mail, body.password);
    }
    return response;
  }

  Future<Result<UserByIdResponse>> getUserInfo() async {
    final response = await mainApiClient.getUserInfoById();
    return response;
  }

  Future<Result<LoginResponse>> refreshToken() async {
    final login = await sessionData.getLogin();
    final password = await sessionData.getPassword();
    final body = LoginRequestBody(mail: login!, password: password!);
    final response = await mainApiClient.login(body);
    if (response.isSuccess()) {
      final success = response as Success;
      await sessionData.saveUserData(success.value.result.token, body.mail, body.password);
    }
    return response;
  }

  Future<void> logout() async {
    // cachedDataRepository.clear();
    await sessionData.clearUserData();
    await settings.storageClear();
  }
}
