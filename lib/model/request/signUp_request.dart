import 'dart:io';

class SignUpRequestModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String deviceToken;
  final String deviceType;

  SignUpRequestModel(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.confirmPassword,
      this.deviceToken,
      this.deviceType});
}
