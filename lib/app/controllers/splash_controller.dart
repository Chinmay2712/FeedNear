import 'package:feednear/app/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  // Function to navigate after delay
  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      // Replace with the screen you want to navigate to
      Get.offAllNamed(Routes.onboarding); // Example route
    });
  }
}
