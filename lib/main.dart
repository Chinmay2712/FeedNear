import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes.dart';
import 'app/constants/theme.dart';
import 'appwrite_provider.dart'; // Import the AppTheme

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey.withOpacity(0.7), // status bar color
  ));
  AppwriteProvider.init();
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
