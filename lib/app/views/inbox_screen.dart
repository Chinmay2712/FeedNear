import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../constants/colors.dart';
import '../controllers/inbox_controller.dart';

class InboxScreen extends StatelessWidget {
  final InboxController controller = Get.put(InboxController());
  final RxBool isSearchExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Default scaffold color as gradient
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.secondaryColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Messages and Reactive Count
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 60, bottom: 3),
              child: Obx(
                    () => Row(
                  children: [
                    const Text(
                      "Messages",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "(${controller.messages.length})",
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Horizontal List of Avatars with Search Icon
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                height: 80,
                child: Obx(
                      () => Stack(
                    children: [
                      // Scrollable ListView of Circle Avatars
                      if (!isSearchExpanded.value)
                        ClipRect(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 88, right: 3), // Padding for fixed search icon
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.avatars.length, // Sample avatar count
                              separatorBuilder: (context, index) => const SizedBox(width: 12),
                              itemBuilder: (context, index) {
                                return CircleAvatar(
                                  radius: 30,
                                  backgroundImage: CachedNetworkImageProvider(
                                      controller.avatars[index]), // Cached avatars
                                );
                              },
                            ),
                          ),
                        ),
                      // Animated Search Icon/Bar
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 400),
                        left: isSearchExpanded.value ? 16 : 16,
                        right: isSearchExpanded.value ? 16 : null,
                        top: isSearchExpanded.value ? 10 : 10,
                        child: GestureDetector(
                          onTap: () => isSearchExpanded.value = !isSearchExpanded.value,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: isSearchExpanded.value ? MediaQuery.of(context).size.width - 32 : 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xff4c967b),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: isSearchExpanded.value
                                ? Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Search',
                                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                                        border: InputBorder.none,
                                        filled: false,
                                      ),
                                      style: const TextStyle(color: Colors.white),
                                      cursorColor: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.close, color: Colors.white),
                                    onPressed: () => isSearchExpanded.value = false,
                                  ),
                                ],
                              ),
                            )
                                : const Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Message Cards at the Bottom
            Expanded(
              child: Stack(
                children: [
                  // Messages in white cards
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.neutralColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Obx(
                            () => ListView.builder(
                          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 90.0),
                          itemCount: controller.messages.length,
                          itemBuilder: (context, index) {
                            final message = controller.messages[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 2.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Card(
                                  color: Colors.white,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  margin: const EdgeInsets.only(bottom: 12),
                                  child: Stack(
                                    children: [
                                      ListTile(
                                        leading: CircleAvatar(
                                          radius: 25,
                                          backgroundImage: CachedNetworkImageProvider(
                                              message.avatarUrl), // Cached avatar images
                                        ),
                                        title: Text(
                                          message.sender,
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        subtitle: Text(
                                          message.content,
                                          maxLines: 1,
                                          style: const TextStyle(fontSize: 13),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            message.time,
                                            style: const TextStyle(color: Colors.grey, fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
