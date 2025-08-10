import 'package:authentication_task/config/extentions/gap_space_extension.dart';
import 'package:authentication_task/feature/presentation/authentication/widgets/registerform_widget.dart';
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';
import 'package:authentication_task/core/dependency_injection/locator.dart';
import 'package:authentication_task/feature/domain/auth/usecase/auth.usecase.dart';
import 'package:authentication_task/feature/presentation/authentication/bloc/auth.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPasswordScreen extends StatelessWidget {
  final String userName;
  LoginPasswordScreen({required this.userName, super.key});

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(locator<AuthUseCases>()),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            123.0.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.0),
              child: Positioned(
                top: 123.h,
                left: 27.w,
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    fontFamily: "circular",
                    fontSize: 32.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 200.h,
              left: 23.w,
              child: RegisterForm(
                hinttext: "Password",
                controller: passwordController,
                onTap: () {
                  final password = passwordController.text;
                  BlocProvider.of<AuthBloc>(context).add(RegisterUserEvent(
                      username: userName, password: password));
                },
                forgottext: "Forgot Password ?",
                buttontext: "Reset",
              ),
            ),
            const Spacer(),
            7.h.verticalSpacer,
          ],
        ),
      ),
    );
  }
}
