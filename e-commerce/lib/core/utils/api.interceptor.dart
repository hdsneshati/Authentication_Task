import 'dart:async';
import 'package:authentication_task/core/utils/api_constants.dart';
import 'package:dio/dio.dart';
import 'error.handler.dart';
import 'preferences_oprator.dart';

class DioClient {
  final Dio _dio;
  final PreferencesOperator _preferences;
  bool _isRefreshing = false;
  final List<Function()> _retryQueue =
      []; //بعد از گرفتن توکن جدید، همه درخواست‌هایی که به خاطر منقضی شدن توکن شکست خوردن رو دوباره اجرا کنیم.

  DioClient(this._dio, this._preferences) {
    _dio.options.baseUrl = ApiConstants.domainName;
    _dio.options.headers['Content-Type'] =
        "application/json"; //نوعی که به سرور میفرستم
    _dio.options.headers['Accept'] =
        'application/json'; //نوعی که توقع دارم بگیرم
    _dio.interceptors.add(_createInterceptor());
  }

  Dio get client => _dio; //ین فقط یک syntax کوتاه برای نوشتن return _dio;

  //handle 401 error
  Future<void> _handle401Error(
      DioException error, ErrorInterceptorHandler handler) async {
    final requestOptions = error
        .requestOptions; //تنظیمات اصلی درخواست شکست‌خورده رو می‌گیره و توی متغیر requestOptions ذخیره می‌کنه.
//چون بعد از حل شدن خطا باید بدونه کدوم درخواست دوباره باید ارسال بشه
    if (_isRefreshing) {
      await _waitForTokenRefresh();
    } else {
      _isRefreshing = true;
      try {
        bool isTokenRefreshed = await _refreshAccessToken();

        if (isTokenRefreshed) {
          print("Token refreshed successfully");
          final newToken = _preferences.getAccToken();

          print("NEW ACC TOKEN IN PREF : ${newToken.toString()}");
          requestOptions.headers['Authorization'] =
              "Bearer $newToken"; //اپدیت کردن با مقدار جدید
          final response = await _dio.fetch(
              requestOptions); //اینجا درخواست که قبلا ارور میداد دوباره ارسال میشه
          handler.resolve(response); //خطا رو برطرف شده اعلام کن
        } else {
          handler.reject(error); //خطا رو رد کن
        }
      } catch (e) {
        print(e.toString());
        print("Status code : ${error.response?.statusCode}");
        print("response data : ${error.response?.data}");

        handler.reject(error);
      } finally {
        //چه حل بشه چه ریجکت بشه این بدنه اجرا میشه
        _isRefreshing = false;
        _runQueuedRequests();
      }
    }
  }

  Future<void> _waitForTokenRefresh() async {
    final completer =
        Completer<void>(); //رای هر درخواست منتظر، یک Completer ساخته میشه.
    _retryQueue.add(completer.complete); //ازاد شدن
    return completer.future;
  }

  void _runQueuedRequests() {
    //همون جاییه که درخواست‌های گیر افتاده آزاد میشن.
    for (var retry in _retryQueue) {
      retry();
    }
    _retryQueue.clear();
  }

  //refresh token method
  Future<bool> _refreshAccessToken() async {
    print(
        "Refreshing access token"); //الان دارم عملیات Refresh Token رو شروع می‌کنم پیام به logنمایش میده

    String? refreshToken = await _preferences.getRefToken();
    print("old REF TOKEN : ${refreshToken.toString()}");
    if (refreshToken == null) {
      return false;
    }
    String url = "${ApiConstants.domainName}${ApiConstants.refreshToken}";
    try {
      Dio d = Dio();
      final response = await d.post(
        url,
        options: Options(headers: {'Authorization': "Bearer $refreshToken"}),
      );
      if (response.statusCode == 201 && response.data != null) {
        final newAccessToken = response.data["accessToken"] ?? "";
        final newRefreshToken = response.data["refreshToken"] ?? "";
        if (newAccessToken.isNotEmpty && newRefreshToken.isNotEmpty) {
          print("\n new ACC TOKEN : ${newAccessToken.toString()}");
          print("\n new REF TOKEN : ${newRefreshToken.toString()}");
          await _preferences.refreshAccessToken(
              newAccessToken, newRefreshToken);

          return true;
        }
      }
    } on DioException {
      //این بخش فقط خطاهای مربوط به Dio رو می‌گیره و به جای کرش کردن برنامه، با false به Caller میگه «عملیات شکست خورد».

      return false;
    }
    return false;
  }

  InterceptorsWrapper _createInterceptor() {
    return InterceptorsWrapper(
      //? ON REQUEST
      onRequest: (options, handler) async {
        print("Request URL: ${options.uri}");
        String? token = _preferences.getAccToken();
        String? refreshToken = await _preferences.getRefToken();
        if (token != null) {
          options.headers['Authorization'] = "Bearer $token";
        }
        options.headers['Connection'] = 'keep-alive';
        return handler.next(options); //همه‌چی آماده‌ست، درخواست رو بفرست».
      },
      //* ON RESPONSE//دریافت پاسخ از سرور و فرستادنش به لایه بالاتر.
      onResponse: (response, handler) {
        print(response.data);
        return handler.next(response);
      },
      //! ON ERROR
      onError: (DioException error, handler) async {
        if (error.response?.statusCode == 401) {
          print("access token expired");
          // handle 401 errors
          return _handle401Error(error, handler);
        }

        print(error);
        // handle other errors
        String errorMessage = DioErrorHandler.handleError(error);

        return handler.reject(DioException(
          requestOptions: error.requestOptions,
          response: error.response,
          error: errorMessage,
          type: error.type,
        ));
      },
    );
  }
}
