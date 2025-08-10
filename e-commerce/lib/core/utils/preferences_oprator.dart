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
    String? token = preferences.getString('acctoken');
    return token;
  }

  Future<String?> getRefToken() async {
    String? token = preferences.getString('reftoken');
    return token;
  }

  Future<void> refreshAccessToken(String acctoken, String reftoken) async {
    await preferences.setString('acctoken', acctoken);
    await preferences.setString('reftoken', reftoken);
  }

  void logout() {
    preferences.clear();
    // preferences.setBool("onboarding-seen", true);
  }

  void saveUserData(UserEntity user) {
    preferences.setString('userName', user.firstName!);
    // preferences.setString('userPhone', user.!);
    preferences.setString('userId', user.id!.toString());
    //preferences.setString('role', user.role![0].toString());
    preferences.setString('acctoken', user.accessToken!);
    // preferences.setString('company-name', user.company!.title);
    // preferences.setString('company-name', user.company!.title);

    preferences.setString('reftoken', user.refreshToken!);
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
    String? result = preferences.getString('reftoken');
    if (result != null) {
      return true;
    } else {
      return false;
    }
  }
}
