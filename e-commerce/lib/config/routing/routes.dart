import 'package:authentication_task/feature/presentation/authentication/screens/login_password_screen.dart';
import 'package:authentication_task/feature/presentation/authentication/screens/login_screen.dart';
import 'package:authentication_task/feature/presentation/intro/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter routs = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: "/splash",
  routes: [
    GoRoute(
      path: '/splash',
      name: "/splash",
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: "/login",
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/loginpassword',
      name: "/loginpassword",
      builder: (context, state) {
        final userName = state.extra as String; // گرفتن ورودی
        return LoginPasswordScreen(userName: userName);
      },
    ),
  ],
);
