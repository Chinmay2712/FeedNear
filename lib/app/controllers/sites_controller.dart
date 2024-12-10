import 'package:get/get.dart';
import '../models/site_model.dart';

class SitesController extends GetxController {
  // Observable list of sites
  var sitesList = <Site>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load sites data when the controller is initialized
    loadSitesData();
  }

  // Method to load mock data or fetch from an API
  void loadSitesData() {
    // Mock data, replace with API call if needed
    sitesList.value = [
      Site(
        name: 'Site 1',
        description: 'This is a description of Site 1.',
        address: '123 Main Street, City, Country',
        imageUrl: 'https://via.placeholder.com/80',
      ),
      Site(
        name: 'Site 2',
        description: 'This is a description of Site 2.',
        address: '456 Elm Street, City, Country',
        imageUrl: 'https://via.placeholder.com/80',
      ),
      Site(
        name: 'Site 3',
        description: 'This is a description of Site 3.',
        address: '789 Oak Street, City, Country',
        imageUrl: 'https://via.placeholder.com/80',
      ),
      Site(
        name: 'Site 4',
        description: 'This is a description of Site 3.',
        address: '789 Oak Street, City, Country',
        imageUrl: 'https://via.placeholder.com/80',
      ),
      Site(
        name: 'Site 5',
        description: 'This is a description of Site 3.',
        address: '789 Oak Street, City, Country',
        imageUrl: 'https://via.placeholder.com/80',
      ),
      Site(
        name: 'Site 6',
        description: 'This is a description of Site 3.',
        address: '789 Oak Street, City, Country',
        imageUrl: 'https://via.placeholder.com/80',
      ),
      // Add more mock data as needed
    ];
  }

// Optional: Add a method to fetch sites from an API
// Future<void> fetchSitesFromApi() async {
//   final response = await http.get('https://api.example.com/sites');
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body);
//     sitesList.value = (data as List).map((siteData) => Site.fromJson(siteData)).toList();
//   } else {
//     throw Exception('Failed to load sites');
//   }
// }
}
