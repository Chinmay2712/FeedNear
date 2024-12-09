import 'dart:async';  // Import Timer package
import 'package:feednear/app/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  final List<OnboardingModel> onboardingItems = [
    OnboardingModel(
      imagePath: 'assets/images/onboarding1.png',
      title: 'Welcome to FeedNear',
      description: 'Connecting people with local donation sites to support communities in need',
    ),
    OnboardingModel(
      imagePath: 'assets/images/onboarding2.png',
      title: 'Discover Sites',
      description: 'Find verified donation sites around you, where you can easily donate food, essentials, and more to make an impact.',
    ),
    OnboardingModel(
      imagePath: 'assets/images/onboarding3.png',
      title: 'Make a Difference',
      description: 'Join a community dedicated to positive change. Share your experiences, post new donation sites, and support trusted locations',
    ),
  ];

  Timer? _timer;  // Declare a Timer

  @override
  void onInit() {
    super.onInit();
    // Start the timer to auto-switch pages every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (currentPage.value < onboardingItems.length - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        // After the last page, restart from the first page
        pageController.jumpToPage(0);
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();  // Cancel the timer when the controller is disposed
    super.onClose();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void navigateToNext() {
    if (currentPage.value < onboardingItems.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to the main app screen
      Get.offAllNamed(Routes.login);
    }
  }
}
