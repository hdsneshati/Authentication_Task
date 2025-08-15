import 'package:authentication_task/core/dependency_injection/locator.dart';
import 'package:authentication_task/core/utils/api.interceptor.dart';
import 'package:authentication_task/core/utils/api_constants.dart';
import 'package:authentication_task/core/utils/preferences_oprator.dart';
import 'package:dio/dio.dart';

class AuthApiProvider {
  final PreferencesOperator preferencesOperator =
      PreferencesOperator(locator());
  final DioClient _dio = locator<DioClient>();

  //
  Future<dynamic> callLogin(String phoneNumber) async {
    var url = "${ApiConstants.domainName}${ApiConstants.login}$phoneNumber";

    var response = await _dio.client.post(url);
    return response;
  }

/*  Future<dynamic> login() async {
    final url = Uri.parse('https://dummyjson.com/auth/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'username': 'emilys',
      'password': 'emilyspass',
      'expiresInMins': 30,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Login successful: $data');
    } else {
      print('Login failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    return response;
  }*/

  Future<dynamic> registerUser(String username, String password) async {
    var url = "${ApiConstants.domainName}${ApiConstants.login}";
    var response = await _dio.client.patch(
      url,
      data: {"name": username, "password": password},
    );

    return response;
  }

  static refreshToken() async {
    PreferencesOperator pr = PreferencesOperator(locator());
    var token = pr.getRefToken();
    print('pr. get ref token');
    Dio dio = Dio();
    String url = "${ApiConstants.domainName}${ApiConstants.refreshToken}";
    var respons = await dio.post(url,
        options: Options(headers: {'Authorization': "Bearer $token"}));
    return respons;
  }
}
