//import 'package:authentication_task/feature/domain/auth/entity/user.entity.dart';

import 'package:authentication_task/core/resource/data_state.dart';
import 'package:authentication_task/feature/data/auth/impl/auth_impl_repository.dart';
import 'package:authentication_task/feature/domain/auth/entity/user.entity.dart';

class AuthUseCases {
  AuthRepositoryIMPL authRepository;
  AuthUseCases(this.authRepository);

  Future<DataState<dynamic>> loginUsecase(String phoneNumber) {
    return authRepository.login(phoneNumber);
  }

  Future<DataState<UserEntity>> registerUser(String username, String password) {
    return authRepository.registerUser(username, password);
  }

  void logout() {
    authRepository.logout();
  }
}
