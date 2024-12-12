import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../constants/colors.dart';
import '../constants/typography.dart';
import '../controllers/map_controller.dart';
import '../controllers/sites_controller.dart';
import '../models/map_model.dart';

class SitesScreen extends StatefulWidget {
  @override
  State<SitesScreen> createState() => _SitesScreenState();
}

class _SitesScreenState extends State<SitesScreen> {
  LocationModel? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Fetch the current location
  void _getCurrentLocation() async {
    final customMapController = CustomMapController();
    LocationModel? currentLocation = await customMapController.getCurrentLocation();
    if (currentLocation != null) {
      setState(() {
        _currentLocation = currentLocation;
      });
    } else {
      print("Could not fetch current location.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final SitesController controller = Get.find();
    final CustomMapController customMapController = CustomMapController();

    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.neutralColor,
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 68.0, bottom: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      focusColor: AppColors.primaryColor,
                      hintText: 'Search Sites',
                      prefixIcon: const Icon(Icons.menu_rounded, color: Colors.grey),
                      suffixIcon: const Icon(Icons.search_rounded, color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const TabBar(
                        indicatorColor: AppColors.primaryColor,
                        labelColor: AppColors.primaryColor,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(text: "Sites"),
                          Tab(text: "Maps"),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Sites Tab
                            Obx(() {
                              if (controller.sitesList.isEmpty) {
                                return const Center(child: Text('No sites available.'));
                              }
                              return ListView.builder(
                                itemCount: controller.sitesList.length,
                                itemBuilder: (context, index) {
                                  final site = controller.sitesList[index];
                                  return Card(
                                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                    elevation: 6,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15),
                                          ),
                                          child: site.imageUrl.isNotEmpty
                                              ? Image.network(
                                            site.imageUrl,
                                            width: 160,
                                            height: 164,
                                            fit: BoxFit.fill,
                                          )
                                              : Container(
                                            width: 120,
                                            height: 120,
                                            color: Colors.grey,
                                            child: const Icon(
                                              Icons.image,
                                              color: Colors.white,
                                              size: 50,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  site.name,
                                                  style: AppTypography.titleMedium.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  site.description,
                                                  style: AppTypography.labelMedium.copyWith(
                                                    color: Colors.grey,
                                                  ),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(height: 12),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.location_on_outlined,
                                                      color: AppColors.greyColor,
                                                      size: 20,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Expanded(
                                                      child: Text(
                                                        site.address,
                                                        style: AppTypography.labelMedium.copyWith(
                                                          color: Colors.grey,
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 4),
                                                Align(
                                                  alignment: Alignment.bottomRight,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      // Add navigation or logic here
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: AppColors.primaryColor,
                                                      // minimumSize: const Size(65, 30),
                                                      visualDensity: VisualDensity.compact,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(25),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                      'Explore',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
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
                                  );
                                },
                              );
                            }),

                            // Maps Tab
                            Stack(
                              children: [
                                _currentLocation == null
                                    ? const Center(child: CircularProgressIndicator())
                                    : FlutterMap(
                                  mapController: customMapController.mapController, // Map controller
                                  options: MapOptions(
                                    initialCenter: LatLng(_currentLocation!.latitude, _currentLocation!.longitude),
                                    initialZoom: 15.0, // Set the zoom level
                                    // Define interaction options (e.g., enabling all interactions)
                                    interactionOptions: const InteractionOptions(
                                      flags: InteractiveFlag.all // Enable zoom on double tap
                                    ), // Enable all interactions like pinch, drag, etc.
                                  ),
                                  children: [
                                    TileLayer(
                                      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                      subdomains: const ['a', 'b', 'c'],
                                    ),
                                    MarkerLayer(
                                      markers: [
                                        Marker(
                                          point: LatLng(_currentLocation!.latitude, _currentLocation!.longitude),
                                          child: Transform.translate(
                                            offset: const Offset(0, -12),
                                            child: const Icon(
                                              Icons.location_on,
                                              size: 30.0, // Customize marker size
                                              color: Colors.red, // Customize the marker color
                                            ),
                                          ),
                                          width: 30,  // Customize the width
                                          height: 30, // Customize the height
                                        ),
                                      ],
                                    ),
                                    // Additional layers (e.g., markers) can be added here
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: GestureDetector(
                                    onVerticalDragStart: (_) {
                                      _showSitesBottomSheet(context);
                                    },
                                    child: Container(
                                      height: 150,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          topRight: Radius.circular(16.0),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          // Drag indicator
                                          Container(
                                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                                            height: 4,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                          ),

                                          // "Sites near you" text
                                          const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Sites near you',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSitesBottomSheet(BuildContext context) {
    final SitesController controller = Get.find(); // Replace with actual data source

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.neutralColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 350,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  height: 4,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const Center(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sites near you',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),

              // Horizontal list of sites
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: controller.sitesList.map((site) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        color: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: SizedBox(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                                child: Image.network(
                                  site.imageUrl,
                                  height: 130,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  site.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  site.description,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 6.0),
                                    child: Icon(Icons.location_on,
                                        color: AppColors.primaryColor, size: 18),
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        site.address,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
