import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Routes {
  static const String home = '/';
  static const String profile = '/profile';

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => HomeScreen(),
      binding: HomeController(), // If you need controller binding
    ),
    // GetPage(
    //   name: profile,
    //   page: () => ProfileScreen(),
    //   binding: ProfileController(), // If you need controller binding
    // ),
    // Add more routes here as your app grows
  ];
}
