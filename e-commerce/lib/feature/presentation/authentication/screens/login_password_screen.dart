import 'package:authentication_task/config/extentions/gap_space_extension.dart';
import 'package:authentication_task/core/widgets/registerform_widget.dart';
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

class LoginPasswordScreen extends StatefulWidget {
  const LoginPasswordScreen({super.key});

  @override
  State<LoginPasswordScreen> createState() => _LoginPasswordScreenState();
}

class _LoginPasswordScreenState extends State<LoginPasswordScreen> {
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
              hinttext: "Password",
              onTap: () {},
              forgottext: "Forgot Password ?",
              buttontext: "Reset",
            ),
          ),
          const Spacer(),

          ///  Align(
          //    alignment: Alignment.center,
          //   child: Container(
          //    width: 134.w,
          //    height: 5.h,
          //    decoration: BoxDecoration(
          //      color: Colors.black,
          //      borderRadius: BorderRadius.circular(100.h),
          //    ),
          //  ),
          // ),
          7.h.verticalSpacer,
        ],
      ),
    );
  }
}
