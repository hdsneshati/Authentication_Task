part of 'auth.bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

//وقتی کاربر می‌خواد ثبت‌نام کنه، فرستاده میشه.
class RegisterUserEvent extends AuthEvent {
  final String password;
  final String username;
  const RegisterUserEvent({required this.username, required this.password});
}

//رویدادی که وقتی کاربر می‌خواد از سیستم خارج بشه فرستاده میشه.
class LogOutEvent extends AuthEvent {}
