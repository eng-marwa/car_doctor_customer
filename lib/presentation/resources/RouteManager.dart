import 'package:flutter/material.dart';

class RouteManager {
  static const splash = '/';
  static const home = '/main';
  static const login = '/login';
  static const register = '/register';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    home: (context) => MainScreen(),
    login: (context) => LoginScreen()
  };
}
