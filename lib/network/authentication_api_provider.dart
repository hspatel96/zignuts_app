

import 'package:dio/dio.dart';
import 'package:zignuts_app/constants/WsConstant.dart';
import 'package:zignuts_app/model/request/login_request.dart';
import 'package:zignuts_app/model/response/login_response.dart';

import '../model/request/signUp_request.dart';
import '../model/response/register_response.dart';
import '../model/response/register_response.dart';
import '../model/response/register_response.dart';


// This provider class provides authentication related  apis
class AuthenticationApiProvider{

  // This method for call register api
  Future<RegisterResponse> callRegisterApi(
      SignUpRequestModel signUpRequest) async {
    FormData formData = new FormData();
    var formParams = Map<String, dynamic>();
    formParams['first_name'] = signUpRequest.firstName;
    formParams['last_name'] = signUpRequest.lastName;
    formParams['email'] = signUpRequest.email;
    formParams['password'] = signUpRequest.password;
    formParams['password_confirmation'] = signUpRequest.confirmPassword;
    formParams['device_token'] = signUpRequest.deviceToken;
    formParams['device_type'] = signUpRequest.deviceType;





    var dio = new Dio();

    dio.options.connectTimeout = 10000; //5s
    dio.options.receiveTimeout = 10000;
    dio.options.headers =  WsConst.getDefaultHeaders();



    formData = FormData.fromMap(formParams);
    try{
      var response = await dio.post(WsConst.registerUrl,
          data: formData,
          options: Options(method: 'POST', responseType: ResponseType.json));
      print("Response status: ${response.statusCode}");
      if (response.statusCode == 200) {
        if (response.data != null) {
          print("Response data: ${response.data}");

          Map responseData = response.data;
          print(response.data.toString());
          return RegisterResponse(message: responseData!=null?responseData["message"]:"",data:responseData!=null?RegisterData.fromJson(responseData["data"]):null,errorMessage: "" );
        }
      }
    }on DioError catch(error){
      return RegisterResponse(message: null,data:null,errorMessage:error.response.data["error"] );

    } catch(error){
      return RegisterResponse(message: null,data:null,errorMessage:"Something went wrong");

    }

  }

  // This method for call login api

  Future<LoginResponse> callLoginApi(
      LoginRequest loginRequest) async {
    FormData formData = new FormData();
    var formParams = Map<String, dynamic>();
    formParams['email'] = loginRequest.email;
    formParams['password'] = loginRequest.password;
    formParams['device_token'] = loginRequest.deviceToken;
    formParams['device_type'] = loginRequest.deviceType;
    formParams['category_id'] = loginRequest.categoryId;





    var dio = new Dio();

    dio.options.connectTimeout = 10000; //5s
    dio.options.receiveTimeout = 10000;
    dio.options.headers =  WsConst.getDefaultHeaders();



    formData = FormData.fromMap(formParams);
   try{
     var response = await dio.post(WsConst.loginUrl,
         data: formData,
         options: Options(method: 'POST', responseType: ResponseType.json));
     print("Response status: ${response.statusCode}");
     if (response.statusCode == 200) {
       if (response.data != null) {
         print("Response data: ${response.data}");

         Map responseData = response.data;
         print(response.data.toString());
         return LoginResponse(message: responseData!=null?responseData["message"]:"",data:responseData!=null?LoginData.fromJson(responseData["data"]):null,errorMessage: "" );
       }
     }
   }on DioError catch(error){
     return LoginResponse(message: null,data:null,errorMessage:error.response.data["error"] );

   } catch(error){
     return LoginResponse(message: null,data:null,errorMessage:"Something went wrong");

   }

  }



}