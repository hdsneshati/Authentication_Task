import 'package:authentication_task/feature/presentation/authentication/screens/login_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SizeConfigInit(
      referenceHeight: 900,
      referenceWidth: 360,
      builder: (context, child) => MaterialApp(
        title: 'Size Config Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPasswordScreen(),
      ),
    );
  }
}
