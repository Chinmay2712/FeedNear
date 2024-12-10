import 'package:feednear/app/bindings/binding.dart';
import 'package:feednear/app/views/onboarding_screen.dart';
import 'package:feednear/app/views/registration_screen.dart';
import 'package:feednear/app/views/home_screen.dart';
import 'package:feednear/app/views/splash_screen.dart';
import 'package:get/get.dart';
import 'views/login_screen.dart';


class Routes {
  static const String home = '/';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String sites = '/sites';
  static const String register = '/register';
  static const String account = '/account';

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => HomeScreen(),
      binding: ScreenBinding(), // If you need controller binding
    ),
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
      binding: ScreenBinding(),
    ),
    GetPage(
      name: register,
      page: () => RegistrationScreen(),
      transition: Transition.rightToLeft,
      binding: ScreenBinding(),
    ),
    // GetPage(
    //   name: profile,
    //   page: () => ProfileScreen(),
    //   binding: ProfileController(), // If you need controller binding
    // ),
  // GetPage(
  //   name: sites,
  //   page: () => SitesScreen(),
  //   binding: ScreenBinding(), // If you need controller binding
  // ),
    // Add more routes here as your app grows
  ];
}
