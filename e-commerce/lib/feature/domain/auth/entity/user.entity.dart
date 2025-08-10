class UserEntity {
  final int? id; // شناسه کاربر
  final String? username; // نام کاربری
  final String? email; // ایمیل
  final String? firstName; // نام کوچک
  final String? lastName; // نام خانوادگی
  final String? gender; // جنسیت
  final String? image; // آدرس عکس پروفایل
  final String? accessToken; // توکن دسترسی (برای درخواست‌ها)
  final String? refreshToken; // توکن رفرش (برای تمدید accessToken)

  UserEntity({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.accessToken,
    this.refreshToken,
  });

  /// 🛠 تبدیل JSON به مدل دارت
  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      image: json['image'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  /// 🛠 تبدیل مدل دارت به JSON (مثلاً برای ذخیره‌سازی یا ارسال به سرور)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'image': image,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory UserEntity.fromJsonWithOutTokens(dynamic json) {
    return UserEntity(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      image: json['image'],
    );
  }
}
