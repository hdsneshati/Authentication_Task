import 'package:authentication_task/core/dependency_injection/locator.dart';
import 'package:authentication_task/feature/presentation/authentication/bloc/auth.bloc.dart';
import 'package:authentication_task/feature/presentation/authentication/bloc/auth_state.dart';
import 'package:authentication_task/feature/presentation/authentication/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:size_config/size_config.dart';
import 'package:authentication_task/core/utils/preferences_oprator.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PreferencesOperator preferencesOperator =
      PreferencesOperator(locator());
  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 5), () {
    //   Navigator.pushReplacement(
    //    context,
    //    MaterialPageRoute(builder: (context) => LoginScreen()),
    //  );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          MainUi(),
          BlocListener<AuthBloc, AuthState>(listener: (context, state) {
            Future.delayed(const Duration(seconds: 1)).then(
              (_) {
                if (preferencesOperator.getAccToken() != null) {
                  String userName = 'h';
                  context.go('/loginpassword', extra: userName);
                } else {
                  context.go('/login');
                }
              },
            );
          }),
        ],
      ),
    );
  }
}

class MainUi extends StatelessWidget {
  const MainUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
