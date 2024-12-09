class RegistrationModel {
  String username;
  String email;
  String password;

  RegistrationModel({
    required this.username,
    required this.email,
    required this.password,
  });

  bool isValid() {
    return username.isNotEmpty && email.isNotEmpty && password.isNotEmpty;
  }
}
