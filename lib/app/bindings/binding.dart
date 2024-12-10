import 'package:feednear/app/controllers/bottom_nav_controller.dart';
import 'package:feednear/app/controllers/registration_controller.dart';
import 'package:feednear/app/controllers/sites_controller.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class ScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(() => RegistrationController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<SitesController>(() => SitesController());
  }
}
