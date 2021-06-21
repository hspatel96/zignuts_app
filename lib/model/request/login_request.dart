import 'dart:io';

class LoginRequest {
  final String email;
  final String password;
  final String deviceToken;
  final String deviceType;
  final int categoryId;

  LoginRequest(
      {this.email,
      this.password,
      this.deviceToken,
      this.deviceType,
      this.categoryId});
}
