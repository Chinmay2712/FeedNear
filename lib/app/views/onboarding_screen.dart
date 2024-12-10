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
              height: 480, // Fixed height for the container
              color: AppColors.neutralColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
            child: Image.asset(
              'assets/images/feednear_green.png',
              width: 250,
              height: 200,
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
                                scale: isCurrentPage ? 0.9 : 0.5,
                                duration: const Duration(milliseconds: 500),
                                child: Image.asset(
                                  item.imagePath,
                                  height: 330,
                                  width: 330,
                                ),
                              );
                            }),
                            Transform.translate(
                              offset: const Offset(0, 37),
                              child: Text(
                                item.title,
                                style: AppTypography.headlineMedium.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Transform.translate(
                                offset: const Offset(0, 55),
                                child: Text(
                                  item.description,
                                  style: AppTypography.labelLarge.copyWith(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    ),
                    // Positioned AnimatedContainer on top of the PageView
                    Positioned(
                      bottom: 280,
                      left: 140,
                      right: 140,
                      child: Obx(
                            () => Container(
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              controller.onboardingItems.length,
                                  (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin:
                                const EdgeInsets.symmetric(horizontal: 5),
                                height: 10,
                                width: controller.currentPage.value == index
                                    ? 20
                                    : 10,
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
                offset: Offset(0, -80),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
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
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          visualDensity: VisualDensity.compact,
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
