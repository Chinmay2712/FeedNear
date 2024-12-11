import 'package:feednear/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:get/get.dart';
import '../constants/typography.dart';
import '../controllers/sites_controller.dart';
import '../utils/draggable_scrollable_bottom_sheet.dart';
import 'package:feednear/app/utils/draggable_scrollable_bottom_sheet.dart'; // Import the NearbySitesSheet file

class SitesScreen extends StatelessWidget {
  final SitesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 68.0, bottom: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Sites',
                prefixIcon: const Icon(Icons.menu_rounded, color: Colors.grey),
                suffixIcon:
                const Icon(Icons.search_rounded, color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                    indicatorColor: Colors.green,
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: "Sites"),
                      Tab(text: "Maps"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Obx(() {
                          if (controller.sitesList.isEmpty) {
                            return const Center(
                                child: Text('No sites available.'));
                          }
                          return ListView.builder(
                            itemCount: controller.sitesList.length,
                            itemBuilder: (context, index) {
                              final site = controller.sitesList[index];
                              return Card(
                                color: Colors.white,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: site.imageUrl.isNotEmpty
                                            ? Image.network(
                                          site.imageUrl,
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        )
                                            : Container(
                                          width: 80,
                                          height: 80,
                                          color: Colors.grey,
                                          child: const Icon(
                                            Icons.image,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              site.name,
                                              style: AppTypography.titleMedium
                                                  .copyWith(
                                                  fontWeight:
                                                  FontWeight.bold),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              site.description,
                                              style: AppTypography.labelMedium
                                                  .copyWith(color: Colors.grey),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                const Icon(Icons.location_on,
                                                    color: Colors.grey,
                                                    size: 18),
                                                const SizedBox(width: 4),
                                                Expanded(
                                                  child: Text(
                                                    site.address,
                                                    style: AppTypography
                                                        .labelMedium
                                                        .copyWith(
                                                        color: Colors.grey),
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),

                        // Maps Tab with NearbySitesSheet
                        Stack(
                          children: [
                            // Map container
                            Container(
                              color: Colors.blue[100], // Placeholder for map
                              child:
                              const Center(child: Text('Map will be here')),
                            ),

                            // Nearby Sites Sheet at the bottom
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: NearbySitesSheet(), // Here we include the NearbySitesSheet widget
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
