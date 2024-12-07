import 'package:feednear/app/bindings/login_binding.dart';
import 'package:feednear/app/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/login_screen.dart';


class Routes {
  static const String home = '/';
  static const String login = '/login';
  static const String profile = '/profile';

  static List<GetPage> routes = [
    // GetPage(
    //   name: home,
    //   page: () => HomeScreen(),
    //   binding: HomeController(), // If you need controller binding
    // ),
    GetPage(
      name: login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    // GetPage(
    //   name: profile,
    //   page: () => ProfileScreen(),
    //   binding: ProfileController(), // If you need controller binding
    // ),
    // Add more routes here as your app grows
  ];
}
