import 'package:feednear/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart'; // Import the controller

class SplashScreen extends StatelessWidget {
  // Instantiate the controller
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Set the gradient background from top to bottom
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor,  // Primary color on top
              AppColors.secondaryColor, // Secondary color on bottom
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/feednear.png', // Add your logo image
            height: 280, // Adjust the height of the logo as needed
            width: 280, // Adjust the width of the logo as needed
          ),
        ),
      ),
    );
  }
}
