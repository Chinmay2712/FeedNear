import 'package:feednear/app/routes.dart';
import 'package:feednear/appwrite_provider.dart';
import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';
import '../models/registration_model.dart';

class RegistrationController extends GetxController {
  var isPasswordObscured = true.obs;
  var registrationModel = RegistrationModel(
    username: '',
    email: '',
    password: '',
  ).obs;
  var isLoading = false.obs;

  // Initialize Appwrite Account service
  final Account account = Account(AppwriteProvider.client);
  final Databases database = Databases(AppwriteProvider.client);

  void register() async {
    if (!registrationModel.value.isValid()) {
      Get.snackbar(
        'Error',
        'All fields are required',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      isLoading.value = true;
      try {
        // Create the user in Appwrite authentication system
        final user = await account.create(
          userId: ID.unique(),  // You can use any unique value for the userId
          email: registrationModel.value.email,
          password: registrationModel.value.password,
          name: registrationModel.value.username,
        );

        // After user creation, store additional user details in the database
        await database.createDocument(
          databaseId: '67582e1700318197658e',
          collectionId: '67582e24000f2a900866',  // Replace with your actual collection ID
          documentId: ID.unique(),  // Unique document ID, can be auto-generated
          data: {
            'username': registrationModel.value.username,
            'email': registrationModel.value.email,
          },
        );

        isLoading.value = false;

        // Handle success, navigate to login or home screen
        Get.snackbar(
          'Success',
          'Registration Successful',
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offNamed(Routes.home);  // Navigate to login screen or home
      } catch (e) {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          'Registration failed: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }
}
