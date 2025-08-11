import 'package:authentication_task/core/dependency_injection/locator.dart';
import 'package:authentication_task/core/resource/data_state.dart';
import 'package:authentication_task/core/utils/error.handler.dart';
import 'package:authentication_task/core/utils/preferences_oprator.dart';
import 'package:authentication_task/feature/domain/auth/entity/user.entity.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/routing/routes.dart';
import '../src/remote/auth.api.dart';

class AuthRepositoryIMPL {
  AuthApiProvider apiProvider;
  PreferencesOperator preferencesOperator =
      PreferencesOperator(locator<SharedPreferences>());

  AuthRepositoryIMPL({required this.apiProvider});

  void logout() {
    preferencesOperator.logout();
    final context = navigatorKey.currentContext;
    if (context != null) {
      GoRouter.of(context).go('/splash');
    }
    //navigatorKey.currentContext?.toSplashScreen();
  }

  Future<DataState<dynamic>> login(String phone) async {
    try {
      Response response = await apiProvider.callLogin(phone);
      if (response.statusCode == 201) {
        return SuccessData(response.data);
      } else {
        return const FailedData("خطایی پیش اومده");
      }
    } on DioException catch (e) {
      String errorMassage = DioErrorHandler.handleError(e);
      return FailedData(errorMassage);
    }
  }

  Future<DataState<UserEntity>> registerUser(
      String username, String password) async {
    try {
      Response response = await apiProvider.registerUser(username, password);
      if (response.statusCode == 200) {
        UserEntity user = UserEntity.fromJsonWithOutTokens(response.data);
        //update
        preferencesOperator.updateUserData(user);
        return SuccessData(user);
      } else {
        return const FailedData("خطایی پیش اومده");
      }
    } on DioException catch (e) {
      String errorMassage = DioErrorHandler.handleError(e);
      return FailedData(errorMassage);
    }
  }
}
