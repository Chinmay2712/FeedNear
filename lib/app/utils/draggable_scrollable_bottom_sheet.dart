import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sites_controller.dart';

class NearbySitesSheet extends StatefulWidget {
  @override
  _NearbySitesSheetState createState() => _NearbySitesSheetState();
}

class _NearbySitesSheetState extends State<NearbySitesSheet> {
  final SitesController sitesController = Get.find();
  final _controller = DraggableScrollableController();
  final _sheetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);
  }

  void _onChanged() {
    final currentSize = _controller.size;
    if (currentSize <= 0.05) {
      _collapse();
    }
  }

  void _collapse() => _animateSheet(0.05);

  void _expand() => _animateSheet(1.0);

  void _animateSheet(double size) {
    _controller.animateTo(
      size,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      key: _sheetKey,
      initialChildSize: 0.5,
      maxChildSize: 1,
      minChildSize: 0.1,
      controller: _controller,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Nearby Sites',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded( // Add this Expanded widget here
                child: Obx(() {
                  // Accessing sitesList from the SitesController
                  if (sitesController.sitesList.isEmpty) {
                    return const Center(child: Text('No sites available.'));
                  }
                  return ListView.builder(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: sitesController.sitesList.length,
                    itemBuilder: (context, index) {
                      final site = sitesController.sitesList[index];
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      site.description,
                                      style: TextStyle(color: Colors.grey),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on,
                                            color: Colors.grey, size: 18),
                                        const SizedBox(width: 4),
                                        Expanded(
                                          child: Text(
                                            site.address,
                                            style: TextStyle(
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
              ),
            ],
          ),
        );
      },
    );
  }
}
