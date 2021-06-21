


import 'package:zignuts_app/model/request/login_request.dart';
import 'package:zignuts_app/model/response/login_response.dart';
import 'package:zignuts_app/network/authentication_api_provider.dart';

import '../model/request/signUp_request.dart';
import '../model/response/register_response.dart';

class AuthenticationController {

  // initialise the provide class
  AuthenticationApiProvider  _authProvider = AuthenticationApiProvider();

  //  This method call from Ui for register  and get response from provider class and return response
  Future<RegisterResponse> signUp(SignUpRequestModel signUpRequestModel) async {
    RegisterResponse  signUpResponse =
    await _authProvider.callRegisterApi(signUpRequestModel);
    return signUpResponse ;
  }

  //  This method call from Ui for login and get response from provider class and return response

  Future<LoginResponse> login({LoginRequest loginRequest}) async {
    LoginResponse  loginResponse =
    await _authProvider.callLoginApi(loginRequest);
    return loginResponse ;
  }



}