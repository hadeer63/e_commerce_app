import 'package:e_commerce_app/features/home/presentation/pages/home.dart';
import 'package:e_commerce_app/features/login/presentation/pages/login.dart';
import 'package:e_commerce_app/features/sign_up/presentaion/pages/signup_screen.dart';
import 'package:flutter/material.dart';

class RoutesName {
  static const String login = "login";
  static const String signUp = "/";
  static const String home = "home";
}

class AppRouter {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );
    }
  }

  static Widget unDefineRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UnDefine Route"),
      ),
      body: const Center(child: Text("Route Not Found")),
    );
  }
}
