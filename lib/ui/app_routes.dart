import 'package:flutter/material.dart';
import 'package:test_projcet_invan/ui/home_screen/home_screen.dart';
import 'package:test_projcet_invan/ui/splash_screen/splash_screen.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String homeScreen = "/home";
  static const String gameDetailScreen = "/game_detail";
  static const String tutorialScreen = "/tutorial_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
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
