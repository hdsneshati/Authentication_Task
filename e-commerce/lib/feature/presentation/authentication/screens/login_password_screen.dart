import 'package:authentication_task/config/theme/color_pallet.dart';
import 'package:authentication_task/feature/presentation/authentication/widgets/primary_button.dart';
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
        children: [
          Positioned(
            top: 123.h,
            left: 27.w,
            child: Text(
              "Sign in",
              style: TextStyle(
                fontFamily: "circular",
                fontSize: 35.sp,
                color: ColorPallet.lightColorScheme.onSurface,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Positioned(
            top: 200.h,
            left: 23.w,
            child: SizedBox(
              width: 344.w,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontFamily: "circular",
                        fontSize: 16.sp,
                        color: ColorPallet.lightColorScheme.onSurface,
                      ),
                    ),
                  ),
                  PrimaryButton(onTap: () {}),
                  Row(
                    children: [
                      Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          fontFamily: "circular",
                          fontSize: 15.sp,
                          color: ColorPallet.lightColorScheme.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Reset",
                        style: TextStyle(
                          fontFamily: "circular",
                          fontSize: 15.sp,
                          color: ColorPallet.lightColorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
