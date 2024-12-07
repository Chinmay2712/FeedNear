import 'package:feednear/app/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../constants/colors.dart'; // Assuming you have your colors defined here

class LoginScreen extends StatelessWidget {
  final LoginController controller =
      Get.put(LoginController()); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.neutralColor,
                      shadowColor: Colors.transparent, // Transparent background
                      side: const BorderSide(
                          color: AppColors.darkColor), // Dark color outline
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30), // Optional: to add rounded corners
                      ),
                    ),
                    child: Text(
                      'Sign in with Google',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight:
                            FontWeight.bold, // Text color remains the same
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Expanded(
                      child: Divider(
                        color: AppColors.greyColor,
                      ),
                    ), // The left side of the divider
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        'or sign in with email', // Text in the middle of the divider
                        style: AppTypography.bodySmall
                            .copyWith(color: AppColors.greyColor),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: AppColors.greyColor,
                      ),
                    ), // The right side of the divider
                  ],
                ),
                const SizedBox(height: 24),
                // Email Field
                TextFormField(
                  onChanged: (value) =>
                      controller.loginModel.value.email = value,
                  decoration: InputDecoration(
                    labelText: 'Enter your Email',
                    labelStyle: const TextStyle(
                      color: AppColors.darkColor, // Keep label color as darkColor
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Circular border with radius 10
                      borderSide: const BorderSide(
                          color: AppColors.darkColor), // Dark border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: AppColors
                              .darkColor), // Keep border color as darkColor when focused
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: AppColors
                              .darkColor), // Keep border color as darkColor when enabled
                    ),
                    filled: true,
                    fillColor: Theme.of(context)
                        .scaffoldBackgroundColor, // Using the theme's background color
                  ),
                ),
                const SizedBox(height: 24),
                // Password Field
                TextFormField(
                  onChanged: (value) =>
                      controller.loginModel.value.password = value,
                  obscureText: controller.isPasswordObscured
                      .value, // Toggle password visibility using controller
                  decoration: InputDecoration(
                    labelText: 'Enter your Password',
                    labelStyle: const TextStyle(
                      color:
                          AppColors.darkColor, // Keep label color as darkColor
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Circular border with radius 10
                      borderSide: const BorderSide(
                          color: AppColors.darkColor), // Dark border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: AppColors
                              .darkColor), // Keep border color as darkColor when focused
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: AppColors
                              .darkColor), // Keep border color as darkColor when enabled
                    ),
                    filled: true,
                    fillColor: Theme.of(context)
                        .scaffoldBackgroundColor, // Using the theme's background color
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordObscured.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors
                            .greyColor, // You can customize the icon color
                      ),
                      onPressed: () {
                        // Toggle the obscureText property
                        controller.togglePasswordVisibility();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12, top: 3),
                  child: Align(
                    alignment: Alignment.centerLeft, // Align to the left
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors
                            .primaryColor, // Set text color to secondary color
                        decoration:
                            TextDecoration.underline, // Underline the text
                        decorationColor: AppColors
                            .primaryColor, // Set underline color to the same as text
                        decorationThickness:
                            1, // Optional: adjust underline thickness
                        fontSize: AppTypography.bodySmall
                            .fontSize, // Use bodySmall font size from AppTypography
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Login Button with gradient background
                controller.isLoading.value
                    ? CircularProgressIndicator()
                    : Container(
                        width: double
                            .infinity, // Make the button as wide as the screen
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context)
                                  .primaryColor, // Using the theme's primary color
                              AppColors
                                  .secondaryColor, // Using the theme's accent color
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: controller.login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.transparent, // Remove default color
                            shadowColor: Colors.transparent, // Remove shadow
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          child: const Text(
                            'Login',
                            style: AppTypography.bodyMedium,
                          ),
                        ),
                      ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
