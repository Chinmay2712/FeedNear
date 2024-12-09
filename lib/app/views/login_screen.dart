import 'package:feednear/app/constants/typography.dart';
import 'package:feednear/app/routes.dart';
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
                const SizedBox(height: 20),
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
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 24, // Adjust based on the button height
                            width: 24, // Keeps the aspect ratio square
                            child: Image.asset(
                              "assets/images/google.png",
                              fit: BoxFit
                                  .contain, // Scales the image to fit within the bounds
                            ),
                          ),
                          const SizedBox(
                              width:
                                  8), // Add spacing between the image and text
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
                ),
                const SizedBox(height: 20),
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
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.greyColor,
                        ),
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
                    hintText: 'Enter your Email',
                    hintStyle: TextStyle(color: AppColors.greyColor),
                    labelText: 'Email',
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
                    hintText: 'Enter your Password',
                    hintStyle: TextStyle(color: AppColors.greyColor),
                    labelText: 'Password',
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
                const SizedBox(height: 18),
                // Login Button with gradient background
                controller.isLoading.value
                    ? CircularProgressIndicator()
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
                                onPressed: controller.login,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  padding:
                                      EdgeInsets.zero, // Remove default padding
                                  minimumSize: const Size(double.infinity,
                                      48), // Set explicit height
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  visualDensity: VisualDensity.compact,
                                ),
                                child: const Text(
                                  'Login',
                                  style: AppTypography.bodyMedium,
                                ),
                              ),
                            ),
                          ),
                          // const SizedBox(
                          //   height: 12, // Ensure exactly 12 units of space
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Transform.translate(
                              offset: Offset(0, -6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account? ",
                                    style: TextStyle(
                                      color: AppColors.greyColor,
                                      fontSize:
                                          AppTypography.bodySmall.fontSize,
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(-12, 0),
                                    child: TextButton(
                                      onPressed: () {
                                        Get.toNamed(
                                          Routes.register,
                                        );
                                      },
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              AppColors.primaryColor,
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
