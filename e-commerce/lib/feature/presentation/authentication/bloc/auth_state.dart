import 'package:authentication_task/feature/presentation/authentication/bloc/auth_status.dart';

class AuthState {
  AuthStatus status;
  AuthState({required this.status});

  AuthState copyWith({AuthStatus? newStatus}) {
    return AuthState(status: newStatus ?? status);
  }
}
