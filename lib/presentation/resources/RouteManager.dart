import 'package:flutter/material.dart';

import '../view/auth/login/LoginScreen.dart';
import '../view/splash/SplashScreen.dart';

class RouteManager {
  static const splash = '/';
  static const home = '/main';
  static const login = '/login';
  static const register = '/register';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => LoginScreen()
    // register: (context) => RegisterScreen()
  };
}
