import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes.dart';
import 'app/constants/theme.dart'; // Import the AppTheme

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FeedNear',
      initialRoute: Routes.splash,
      getPages: Routes.routes,
      theme: AppTheme.theme, // Use AppTheme.theme
    );
  }
}
