import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension Navigation on BuildContext {
  void goSplashScreen() {
    go('/splash');
  }

  void toSplashScreen() {
    goNamed('/splash');
  }

  void pushReplacementLogin() {
    pushReplacementNamed('/login');
  }

  void toSignupScreen() {
    goNamed('/signup');
  }
}
