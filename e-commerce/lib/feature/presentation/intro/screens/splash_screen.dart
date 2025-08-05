import 'package:authentication_task/config/asset/svg_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 115), () {
      // Navigator.pushReplacement(
      //  context,
      //  MaterialPageRoute(builder: (context) => const LoginScreen()),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                SvgPath.sp,
                width: 100,
                height: 100,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onPrimary,
                  BlendMode.srcIn,
                ),
              )),
        ],
      ),
    );
  }
}
