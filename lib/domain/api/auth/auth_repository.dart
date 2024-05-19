import 'package:movies_app/domain/api/auth/auth_api_client.dart';
import 'package:movies_app/domain/models/make_login.dart';

class AuthRepository {
  static Future<MakeLogin> getAuthLoginUser(String username, String password) =>
      AuthApiClient.getLoginUser(username, password);
}