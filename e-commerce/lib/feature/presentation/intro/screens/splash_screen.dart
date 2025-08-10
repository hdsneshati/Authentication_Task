import 'package:authentication_task/feature/presentation/authentication/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          /*  Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                SvgPath.splash,
                width: 100,
                height: 100,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onPrimary,
                  BlendMode.srcIn,
                ),
              )),*/
          SizedBox(
            height: 382.h,
          ),
          Center(child: Image.asset('assets/img/Rectangle.png'))
        ],
      ),
    );
  }
}
