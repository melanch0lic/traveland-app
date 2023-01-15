import '../../data/network/main_api_client.dart';
import '../../data/network/models/login_request_body.dart';
import '../../data/network/models/response/login_response.dart';
import '../../data/network/models/response/register_response.dart';
import '../../data/network/models/response/user_by_id_response.dart';
import '../../data/network/register_request_body.dart';
import '../../data/network/result.dart';
import '../../data/network/session_data.dart';

class AuthService {
  final SessionData sessionData;
  final MainApiClient mainApiClient;

  AuthService({required this.sessionData, required this.mainApiClient});

  Future<bool> isUserAuthorized() async {
    final jwtToken = await sessionData.getJwtToken();
    return jwtToken != null;
  }

  Future<Result<LoginResponse>> login(LoginRequestBody body) async {
    final response = await mainApiClient.login(body);

    if (response.isSuccess()) {
      final success = response as Success;
      await sessionData.saveUserData(
          success.value.jwtToken.token, success.value.jwtToken.userId.toString(), body.mail, body.password);
      // await settings.saveRememberUserMode(isRememberUser);
    }
    return response;
  }

  Future<Result<RegisterResponse>> register(RegisterRequestBody body) async {
    final response = await mainApiClient.registerUser(body);
    return response;
  }

  Future<Result<UserByIdResponse>> getUserInfo() async {
    final userId = await sessionData.getUserId();
    final response = await mainApiClient.getUserInfoById(userId!);
    return response;
  }

  // Future<Result<LoginResponse>> refreshToken() async {
  //   final login = await sessionData.getLogin();
  //   final password = await sessionData.getPassword();
  //   final response = await apiClient.login(login!, password!);
  //   if (response.isSuccess()) {
  //     final success = response as Success;
  //     await sessionData.saveJwtToken(success.value.jwtToken, login, password);
  //   }
  //   return response;
  // }

  Future<void> logout() async {
    // cachedDataRepository.clear();
    await sessionData.clearUserData();
  }
}
