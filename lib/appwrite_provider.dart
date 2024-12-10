import 'package:appwrite/appwrite.dart';

class AppwriteProvider {
  static final Client client = Client();
  static late final Account account;
  static late final Databases database;

  static void init() {
    // Initialize the client with your Appwrite endpoint and project ID
    client
        .setEndpoint('https://cloud.appwrite.io/v1') // Replace with your Appwrite endpoint
        .setProject('675821990037d10f250d'); // Replace with your Appwrite project ID

    // Initialize Appwrite services (Account and Database)
    account = Account(client);
    database = Databases(client);
  }
}
