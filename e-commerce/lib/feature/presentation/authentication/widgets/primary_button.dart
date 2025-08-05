import 'package:authentication_task/config/theme/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;

  const PrimaryButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 48.6.w, vertical: 11.h),
        width: 344.w,
        height: 49.h,
        decoration: BoxDecoration(
          color: ColorPallet.lightColorScheme.primary,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            "Continue",
            style: TextStyle(
                fontFamily: "circular",
                fontSize: 16.sp,
                color: ColorPallet.lightColorScheme.onPrimaryFixed,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
