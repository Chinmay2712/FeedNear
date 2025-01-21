// Login Screen
import 'package:feednear/app/constants/typography.dart';
import 'package:feednear/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../constants/colors.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: screenHeight,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        child: Form(
          key: _formKey,
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.neutralColor,
                      shadowColor: Colors.transparent,
                      side: const BorderSide(color: AppColors.darkColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: screenHeight * 0.03,
                          width: screenHeight * 0.03,
                          child: Image.asset(
                            "assets/images/google.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          'Sign in with Google',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Expanded(
                      child: Divider(color: AppColors.greyColor),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      child: Text(
                        'or sign in with email',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(color: AppColors.greyColor),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.04),
                TextFormField(
                  onChanged: (value) => controller.loginModel.value.email = value,
                  validator: controller.validateEmail,
                  decoration: InputDecoration(
                    hintText: 'Enter your Email',
                    hintStyle: TextStyle(color: AppColors.greyColor),
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: AppColors.darkColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.darkColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.darkColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.darkColor),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                TextFormField(
                  onChanged: (value) => controller.loginModel.value.password = value,
                  validator: controller.validatePassword,
                  obscureText: controller.isPasswordObscured.value,
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    hintStyle: TextStyle(color: AppColors.greyColor),
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: AppColors.darkColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.darkColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.darkColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.darkColor),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordObscured.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.greyColor,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.01, left: screenWidth * 0.035),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor,
                        decorationThickness: 1,
                        fontSize: AppTypography.bodySmall.fontSize,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.025),
                controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              AppColors.primaryColor,
                              AppColors.secondaryColor,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              controller.login();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            visualDensity: VisualDensity.compact,
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(double.infinity, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: AppTypography.bodyMedium,
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(screenWidth * 0.03, - screenHeight * 0.001),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: AppColors.greyColor,
                              fontSize: AppTypography.bodySmall.fontSize,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(-screenWidth * 0.03, 0),
                            child: TextButton(
                              onPressed: () => Get.toNamed(Routes.register),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.primaryColor,
                                  decorationThickness: 1,
                                  fontSize:
                                  AppTypography.bodySmall.fontSize,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}