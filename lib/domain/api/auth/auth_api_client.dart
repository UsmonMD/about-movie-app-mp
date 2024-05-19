import 'package:dio/dio.dart';
import 'package:movies_app/domain/models/make_login.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final status = response.statusCode;
    final isValid = status != null && status >= 200 && status < 300;
    if (!isValid) {
      throw DioException.badResponse(
        statusCode: status!,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
    super.onResponse(response, handler);
  }
}

abstract class AuthApiClient {
  static const apiKey = '?api_key=22e6d931b1ec0bd098c4998a2f4f549f';

  static final dio = Dio(
    BaseOptions(
      contentType: Headers.jsonContentType,
      validateStatus: (int? status) {
        return status != null;
        // return status != null && status >= 200 && status < 300;
      },
    ),
  );

  static Future<MakeLogin> getLoginUser(
    String username,
    String password,
  ) async {
    String? token = '';
    final tokenResponse = await dio.get(
        'https://api.themoviedb.org/3/authentication/token/new$apiKey');
    try {
      final makeToken = MakeLogin.fromJson(tokenResponse.data);
      token = makeToken.requestToken;
    } catch (e) {
      throw Exception('ERROR: ${tokenResponse.statusCode}');
    }
    final loginResponse = await dio.post(
      'https://api.themoviedb.org/3/authentication/token/validate_with_login$apiKey',
      data: {
        'username': username,
        'password': password,
        'request_token': token
      },
    );
    try {
      final makeLogin = MakeLogin.fromJson(loginResponse.data);
      return makeLogin;
    } catch (_) {
      final makeLogin = MakeLogin.fromJson(loginResponse.data);
      return makeLogin;
    }
  }
}
