import 'package:feednear/app/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Lazy load the LoginController
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
