import 'package:feednear/app/bindings/login_binding.dart';
import 'package:feednear/app/bindings/registration_binding.dart';
import 'package:feednear/app/controllers/login_controller.dart';
import 'package:feednear/app/views/onboarding_screen.dart';
import 'package:feednear/app/views/registration_screen.dart';
import 'package:feednear/app/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/login_screen.dart';


class Routes {
  static const String home = '/';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String profile = '/profile';

  static List<GetPage> routes = [
    // GetPage(
    //   name: home,
    //   page: () => HomeScreen(),
    //   binding: HomeController(), // If you need controller binding
    // ),
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: onboarding,
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: login,
      page: () => LoginScreen(),
      transition: Transition.leftToRight,
      binding: LoginBinding(),
    ),
    GetPage(
      name: register,
      page: () => RegistrationScreen(),
      transition: Transition.rightToLeft,
      binding: RegistrationBinding(),
    ),
    // GetPage(
    //   name: profile,
    //   page: () => ProfileScreen(),
    //   binding: ProfileController(), // If you need controller binding
    // ),
    // Add more routes here as your app grows
  ];
}
