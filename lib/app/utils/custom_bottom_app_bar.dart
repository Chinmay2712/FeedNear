import 'package:feednear/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottom_nav_controller.dart';

class CustomBottomAppBar extends StatelessWidget {
  final BottomNavController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 7.0,
            elevation: 10.0,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Transform.translate(
                    offset: const Offset(-5, -3),
                    child: _buildNavItem(Icons.location_on, "Sites",
                        controller.currentIndex.value == 0, 0)),
                Transform.translate(
                  offset: const Offset(-1, -3),
                  child: _buildNavItem(
                      Icons.chat, "Inbox", controller.currentIndex.value == 1, 1),
                ),
                const SizedBox(width: 42), // Space for FAB
                Transform.translate(
                  offset: const Offset(7, -3),
                  child: _buildNavItem(Icons.groups_rounded, "Community",
                      controller.currentIndex.value == 2, 2),
                ),
                Transform.translate(
                  offset: const Offset(7, -3),
                  child: _buildNavItem(Icons.account_circle, "Account",
                      controller.currentIndex.value == 3, 3),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildNavItem(
      IconData icon, String label, bool isSelected, int index) {
    return GestureDetector(
      onTap: () => controller.changeIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : AppColors.primaryColor,
            ),
          ),
          Transform.translate(
            offset: const Offset(0, 3),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
