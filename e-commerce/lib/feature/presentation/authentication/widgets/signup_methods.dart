import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

class SignUpMethodd extends StatelessWidget {
  final String iconpath;
  final String lable;
  const SignUpMethodd({
    required this.iconpath,
    required this.lable,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 49.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.h),
        color: const Color(0xffF4F4F4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // SvgPicture.asset(
          //   iconpath,
          //  width: 20.w,
          //   height: 24.59.h,
          // ),
          Image.asset(iconpath),
          Row(
            children: [
              Text(
                "Continue With ",
                style: TextStyle(
                  fontFamily: "circular",
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                lable,
                style: TextStyle(
                  fontFamily: "circular",
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
