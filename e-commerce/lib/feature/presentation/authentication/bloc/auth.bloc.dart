import 'package:authentication_task/feature/domain/auth/usecase/auth.usecase.dart';
import 'package:authentication_task/feature/presentation/authentication/bloc/auth_state.dart';
import 'package:authentication_task/feature/presentation/authentication/bloc/auth_status.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCases useCases;
  AuthBloc(this.useCases) : super(AuthState(status: InintialAuthStatus())) {
    //! check user info event

    on<RegisterUserEvent>(
      (event, emit) async {
        emit(AuthState(status: LoadingAuthStatus()));
        DataState data =
            await useCases.registerUser(event.username, event.password);
        if (data is SuccessData) {
          emit(state.copyWith(newStatus: SuccessRegisterUser(user: data.data)));
        } else {
          emit(state.copyWith(newStatus: ErrorAuthStatus(data.error!)));
        }
      },
    );

    on<LogOutEvent>((event, emit) {
      useCases.logout();
      emit(AuthState(status: InintialAuthStatus()));
    });
  }
}
