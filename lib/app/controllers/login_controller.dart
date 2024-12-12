// Login Controller
import 'package:feednear/app/routes.dart';
import 'package:get/get.dart';
import '../models/login_model.dart';

class LoginController extends GetxController {
  // Observable variable for the login data model
  var isPasswordObscured = true.obs;
  var loginModel = LoginModel(email: '', password: '').obs;
  var isLoading = false.obs;

  // Email validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Password validation
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Enter a valid Password';
    }
    return null;
  }

  // Function to handle login
  void login() {
    isLoading.value = true;
    // Simulate an API call for login
    Future.delayed(Duration(seconds: 2), () {
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

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }
}