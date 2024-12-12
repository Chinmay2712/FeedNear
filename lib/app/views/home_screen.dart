import 'package:feednear/app/constants/colors.dart';
import 'package:feednear/app/views/sites_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottom_nav_controller.dart';
import '../utils/custom_bottom_app_bar.dart';
import 'inbox_screen.dart';
import 'community_screen.dart';
import 'account_screen.dart';

class HomeScreen extends StatelessWidget {
  final BottomNavController controller = Get.find();

  final List<Widget> screens = [
    SitesScreen(),
    InboxScreen(),
    CommunityScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.neutralColor,
      extendBody: true,
      body: screens[controller.currentIndex.value],
      bottomNavigationBar: CustomBottomAppBar(),
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          onPressed: () {
            Get.snackbar('FAB Action', 'You pressed the FAB!');
          },
          backgroundColor: AppColors.primaryColor,
          shape: const CircleBorder(),
          // elevation: 5.0,
          child: const Icon(Icons.add, color: Colors.white, size: 30,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }
}
