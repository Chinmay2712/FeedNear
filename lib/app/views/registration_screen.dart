import 'package:feednear/app/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/registration_controller.dart';
import '../constants/colors.dart';
import '../routes.dart';

class RegistrationScreen extends StatelessWidget {
  final RegistrationController controller =
  Get.put(RegistrationController()); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 150, left: 16, right: 16, bottom: 16),
        child: Obx(() {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Register",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                const SizedBox(height: 24),
                // Username Field
                TextFormField(
                  onChanged: (value) =>
                  controller.registrationModel.value.username = value,
                  decoration: InputDecoration(
                    hintText: "Enter your Username",
                    hintStyle: const TextStyle(color: AppColors.greyColor),
                    labelText: 'Username',
                    labelStyle: const TextStyle(
                      color: AppColors.darkColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: AppColors.darkColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: AppColors.darkColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: AppColors.darkColor),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
                const SizedBox(height: 24),
                // Email Field
                TextFormField(
                  onChanged: (value) =>
                  controller.registrationModel.value.email = value,
                  decoration: InputDecoration(
                    hintText: "Enter your Email",
                    hintStyle: const TextStyle(color: AppColors.greyColor),
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      color: AppColors.darkColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: AppColors.darkColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: AppColors.darkColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: AppColors.darkColor),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
                const SizedBox(height: 24),
                // Password Field
                TextFormField(
                  onChanged: (value) =>
                  controller.registrationModel.value.password = value,
                  obscureText: controller.isPasswordObscured.value,
                  decoration: InputDecoration(
                    hintText: "Enter your Password",
                    hintStyle: const TextStyle(color: AppColors.greyColor),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: AppColors.darkColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: AppColors.darkColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: AppColors.darkColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: AppColors.darkColor),
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
                      onPressed: () {
                        controller.togglePasswordVisibility();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 3),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Maximum 8 characters",
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: AppTypography.bodySmall.fontSize,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Register Button with gradient background
                controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : SizedBox(
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          AppColors.secondaryColor,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        controller.register;
                        Get.toNamed(Routes.home);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: AppTypography.bodyMedium,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: Transform.translate(
                    offset: const Offset(0, -6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: AppTypography.bodySmall.fontSize,
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(-17, 0),
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(
                                Routes.login,
                              );
                            },
                            child: Text(
                              "Login",
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
                ),
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
                        'or', // Text in the middle of the divider
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
                const SizedBox(height: 20,),
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
              ],
            ),
          );
        }),
      ),
    );
  }
}
