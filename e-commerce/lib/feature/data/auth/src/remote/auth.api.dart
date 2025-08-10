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

  Future<dynamic> registerUser(String username, String companyName) async {
    var url = "${ApiConstants.domainName}${ApiConstants.me}";
    var response = await _dio.client.patch(
      url,
      data: {"name": username, "companyTitle": companyName},
    );

    return response;
  }

  static refreshToken() async {
    PreferencesOperator pr = PreferencesOperator(locator());
    var token = pr.getRefToken();
    Dio dio = Dio();
    String url = "${ApiConstants.domainName}${ApiConstants.refreshToken}";
    var respons = await dio.post(url,
        options: Options(headers: {'Authorization': "Bearer $token"}));
    return respons;
  }
}
