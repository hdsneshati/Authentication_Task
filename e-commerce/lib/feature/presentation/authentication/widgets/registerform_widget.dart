import 'package:authentication_task/feature/presentation/authentication/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

class RegisterForm extends StatelessWidget {
  final String hinttext;
  final String forgottext;
  final String buttontext;
  final VoidCallback onTap;

  const RegisterForm({
    required this.forgottext,
    required this.buttontext,
    required this.hinttext,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 32.h),
      child: SizedBox(
        width: 344.w,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 239, 237, 237),
                      width: 0.0), // Custom border
                  borderRadius:
                      BorderRadius.circular(4.0), // Optional: round the border
                ),
                hintText: hinttext,
                hintStyle: TextStyle(
                  fontFamily: "circular",
                  fontSize: 16.sp,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
            ),
            12.h.verticalSpacer,
            PrimaryButton(onTap: onTap),
            12.h.verticalSpacer,
            Row(
              children: [
                Text(
                  forgottext,
                  style: TextStyle(
                    fontFamily: "circular",
                    fontSize: 12.sp,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  buttontext,
                  style: TextStyle(
                    fontFamily: "circular",
                    fontSize: 12.sp,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
