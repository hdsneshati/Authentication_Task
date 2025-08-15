import 'package:authentication_task/core/dependency_injection/locator.dart';
import 'package:authentication_task/feature/domain/auth/entity/user.entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*ایجاد یک لایه‌ی انتزاعی روی SharedPreferences تا کدهای اپلیکیشن به جای استفاده مستقیم از SharedPreferences، از این کلاس استفاده کنن.*/
class PreferencesOperator {
  SharedPreferences preferences;
  PreferencesOperator(this.preferences) {
    preferences = locator<SharedPreferences>();
  }
  String? getAccToken() {
    String? token = preferences.getString("accessToken");
    return token;
  }

  Future<String?> getRefToken() async {
    String? token = preferences.getString("refreshToken");
    print(token);
    return token;
  }

  Future<void> refreshAccessToken(String acctoken, String reftoken) async {
    await preferences.setString("accessToken", acctoken);
    await preferences.setString("refreshToken", reftoken);
  }

  void logout() {
    preferences.clear();
    // preferences.setBool("onboarding-seen", true);
  }

  void saveUserData(UserEntity user) {
    preferences.setString('userName', user.firstName!);

    print(user.firstName);
    // preferences.setString('userPhone', user.!);
    preferences.setString('userId', user.id!.toString());
    print(user.id);

    //preferences.setString('role', user.role![0].toString());
    preferences.setString("accessToken", user.accessToken!);
    print(user.accessToken);

    // preferences.setString('company-name', user.company!.title);
    // preferences.setString('company-name', user.company!.title);

    preferences.setString("refreshToken", user.refreshToken!);
    print(user.refreshToken);
  }

  void updateUserData(UserEntity user) {
    preferences.setString('userName', user.firstName!);
    //preferences.setString('company-name', user.company!.title);
  }

  Map<String, dynamic> getUserData() {
    final String? name = preferences.getString('userName');
    final String? phoneNumber = preferences.getString('userPhone');
    final String? id = preferences.getString('userId');
    final String? role = preferences.getString('role');
    return {
      'name': name ?? '',
      'phoneNumber': phoneNumber ?? '',
      'id': id ?? '',
      'role': role ?? '',
    };
  }

  bool isUserLoggedInBefor() {
    String? result = preferences.getString("refreshToken");
    if (result != null) {
      return true;
    } else {
      return false;
    }
  }
}
