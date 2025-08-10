import 'package:authentication_task/config/extentions/gap_space_extension.dart';
import 'package:authentication_task/feature/presentation/authentication/widgets/registerform_widget.dart';
import 'package:authentication_task/feature/presentation/authentication/widgets/signup_methods.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:size_config/size_config.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              hinttext: "Email Address",
              controller: Controller,
              onTap: () {
                final userName = Controller.text;
                context.go('/loginpassword', extra: userName);
              },
              forgottext: "Dont have an Account ?",
              buttontext: " Create One",
            ),
          ),
          71.h.verticalSpacer,
          const Center(
            child: Column(
              children: [
                SignUpMethodd(
                  iconpath: 'assets/img/Apple.png',
                  lable: "Apple ",
                ),
                SizedBox(
                  height: 12,
                ),
                SignUpMethodd(
                  iconpath: 'assets/img/Google.png',
                  lable: "Google ",
                ),
                SizedBox(
                  height: 12,
                ),
                SignUpMethodd(
                  iconpath: 'assets/img/Facebook.png',
                  lable: "Facebook ",
                )
              ],
            ),
          ),
          const Spacer(),
          7.h.verticalSpacer,
        ],
      ),
    );
  }
}
