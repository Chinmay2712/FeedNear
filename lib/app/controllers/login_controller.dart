import 'package:feednear/app/routes.dart';
import 'package:get/get.dart';
import '../models/login_model.dart';

class LoginController extends GetxController {
  // Observable variable for the login data model
  var isPasswordObscured = true.obs;
  var loginModel = LoginModel(email: '', password: '').obs;
  var isLoading = false.obs;

  // Function to handle login
  void login() {
    // Check if the login model is valid
    if (!loginModel.value.isValid()) {
      Get.snackbar('Error', 'Email and Password cannot be empty',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      isLoading.value = true;
      // Simulate an API call for login
      Future.delayed(Duration(seconds: 2), () {
        // Here, you can check credentials with your API or auth service
        isLoading.value = false;
        if (loginModel.value.email == 'test@example.com' &&
            loginModel.value.password == 'password') {
          // Navigate to another screen on successful login
          Get.offNamed(Routes.sites); // Use the route to navigate
        } else {
          Get.snackbar('Login Failed', 'Invalid email or password',);
        }
      });
    }
  }

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }
}
