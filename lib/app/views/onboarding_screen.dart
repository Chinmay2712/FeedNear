import 'package:flutter/material.dart';
import 'package:feednear/app/constants/typography.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../controllers/onboarding_controller.dart';
import '../utils/bottom_curve_clipper.dart'; // Import the Clipper file

class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryColor, // Primary color on top
                  AppColors.secondaryColor, // Secondary color on bottom
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Custom clipped container for the white section
          ClipPath(
            clipper: BottomCurveClipper(),
            child: Container(
              height: screenHeight * 0.6, // Responsive height
              color: AppColors.neutralColor,
            ),
          ),
          Positioned(
            top: screenHeight * 0.001,
            left: screenWidth * 0.2,
            child: Image.asset(
              'assets/images/feednear_green.png',
              width: screenWidth * 0.6,
              height: screenHeight * 0.3,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    // PageView.builder in the background
                    PageView.builder(
                      controller: controller.pageController,
                      onPageChanged: controller.onPageChanged,
                      itemCount: controller.onboardingItems.length,
                      itemBuilder: (context, index) {
                        final item = controller.onboardingItems[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(() {
                              // AnimatedScale for pop-up effect
                              final isCurrentPage =
                                  controller.currentPage.value == index;
                              return AnimatedScale(
                                scale: isCurrentPage ? 1.1 : 0.9,
                                duration: const Duration(milliseconds: 500),
                                child: Image.asset(
                                  item.imagePath,
                                  height: screenHeight * 0.5,
                                  width: screenWidth * 0.8,
                                ),
                              );
                            }),
                            SizedBox(height: screenHeight * 0.01),
                            Transform.translate(
                              offset: Offset(0, -screenHeight * 0.03),
                              child: Text(
                                item.title,
                                style: AppTypography.headlineMedium.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(0, -screenHeight * 0.03),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.07,
                                  vertical: screenHeight * 0.02,
                                ),
                                child: Text(
                                  item.description,
                                  style: AppTypography.labelLarge.copyWith(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    // Positioned AnimatedContainer on top of the PageView
                    Positioned(
                      bottom: screenHeight * 0.363,
                      left: screenWidth * 0.4,
                      right: screenWidth * 0.4,
                      child: Obx(
                            () => Container(
                          width: screenWidth * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.01,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              controller.onboardingItems.length,
                                  (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.01,
                                ),
                                height: screenHeight * 0.01,
                                width: controller.currentPage.value == index
                                    ? screenWidth * 0.04
                                    : screenWidth * 0.025,
                                decoration: BoxDecoration(
                                  color: controller.currentPage.value == index
                                      ? Colors.white
                                      : AppColors.greyColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(0, -screenHeight * 0.15),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ElevatedButton(
                        onPressed: controller.navigateToNext,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          visualDensity: VisualDensity.compact,
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                          minimumSize: Size(double.infinity, screenHeight * 0.06),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Obx(() {
                          return Text(
                            controller.currentPage.value ==
                                controller.onboardingItems.length - 1
                                ? 'Get Started'
                                : 'Next',
                            style: AppTypography.bodyLarge.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
