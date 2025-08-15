import 'package:authentication_task/core/dependency_injection/locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:size_config/size_config.dart';
import 'package:authentication_task/core/utils/preferences_oprator.dart';
import 'dart:convert'; // برای jsonDecode
import 'package:http/http.dart' as http;

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
    Future.delayed(const Duration(seconds: 3)).then(
      (_) {
        mainget();
        /* if ((preferencesOperator.getAccToken() ?? '').isNotEmpty ||
            preferencesOperator.getAccToken() != null) {
          String userName = 'h';
          context.go('/loginpassword', extra: userName);
        } else {
          context.go('/login');
        }*/
      },
    );
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
          const MainUi(),
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
    return Expanded(
      child: Column(
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

void mainget() async {
  // درخواست GET
  final response = await http.get(
    Uri.parse('https://dummyjson.com/test'),
  );

  if (response.statusCode == 200) {
    // تبدیل پاسخ به Map
    final data = jsonDecode(response.body);
    print('mainget');
    print(data); // { status: 'ok', method: 'GET' }
  } else {
    print('Error: ${response.statusCode}');
  }
}
