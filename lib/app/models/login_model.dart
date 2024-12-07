class LoginModel {
  String email;
  String password;

  LoginModel({required this.email, required this.password});

  // You can also add a method to validate the fields
  bool isValid() {
    return email.isNotEmpty && password.isNotEmpty;
  }

// You can also create a method to map from JSON if needed
// factory LoginModel.fromJson(Map<String, dynamic> json) {
//   return LoginModel(
//     email: json['email'],
//     password: json['password'],
//   );
// }

// Map<String, dynamic> toJson() {
//   return {
//     'email': email,
//     'password': password,
//   };
// }
}
