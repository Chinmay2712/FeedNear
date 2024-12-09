import 'package:get/get.dart';
import '../models/registration_model.dart';

class RegistrationController extends GetxController {
  var isPasswordObscured = true.obs;
  var registrationModel = RegistrationModel(
    username: '',
    email: '',
    password: '',
  ).obs;
  var isLoading = false.obs;

  void register() {
    if (!registrationModel.value.isValid()) {
      Get.snackbar(
        'Error',
        'All fields are required',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      isLoading.value = true;
      Future.delayed(const Duration(seconds: 2), () {
        isLoading.value = false;
        Get.snackbar(
          'Success',
          'Registration Successful',
          snackPosition: SnackPosition.BOTTOM,
        );
        // Navigate to login or home screen
        Get.offNamed('/login');
      });
    }
  }

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }
}
