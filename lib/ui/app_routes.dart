import 'package:flutter/material.dart';
import 'package:test_projcet_invan/ui/auth_screen/auth_screen_part.dart';
import 'package:test_projcet_invan/ui/home_screen/home_screen.dart';

import 'splash_screen/splash_screen_part.dart';


class RouteNames {
  static const String splashScreen = "/";
  static const String homeScreen = "/home";
  static const String auth = "/auth";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.auth:
        return MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        );
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not found!"),
            ),
          ),
        );
    }
  }
}
