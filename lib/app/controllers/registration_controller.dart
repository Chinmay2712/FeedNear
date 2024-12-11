import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:feednear/app/routes.dart';
import 'package:feednear/appwrite_provider.dart';
import 'package:get/get.dart';
import '../models/registration_model.dart';

class RegistrationController extends GetxController {
  var isPasswordObscured = true.obs;
  var registrationModel = RegistrationModel(username: '', email: '', password: '').obs;
  var isLoading = false.obs;

  final Account account = Account(AppwriteProvider.client);
  final Databases database = Databases(AppwriteProvider.client);

  Future<void> register() async {
    if (!registrationModel.value.isValid()) {
      Get.snackbar('Error', 'All fields are required', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    try {
      final user = await account.create(
        userId: ID.unique(),
        email: registrationModel.value.email,
        password: registrationModel.value.password,
        name: registrationModel.value.username,
      );

      await database.createDocument(
        databaseId: '67582e1700318197658e',
        collectionId: '67582e24000f2a900866',
        documentId: ID.unique(),
        data: {
          'username': registrationModel.value.username,
          'email': registrationModel.value.email,
        },
      );

      Get.snackbar('Success', 'Registration successful', snackPosition: SnackPosition.BOTTOM);
      Get.offNamed(Routes.home);
    } catch (e) {
      Get.snackbar('Error', 'Registration failed: ${e.toString()}', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }
}