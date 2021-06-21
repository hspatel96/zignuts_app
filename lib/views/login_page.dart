

import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:sizer/sizer.dart';
import 'package:toast/toast.dart';
import 'package:zignuts_app/constants/string_constant.dart';
import 'package:zignuts_app/controllers/authentication_controller.dart';
import 'package:zignuts_app/helper/preference_helper.dart';
import 'package:zignuts_app/model/request/login_request.dart';

import 'home_page.dart';
import 'widgets/custom_button.dart';

class LoginPage extends StatefulWidget {

  // using this fuction we get the callback of sign Up text button click
  final Function signUpPressed ;

  const LoginPage({Key key, this.signUpPressed}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //declaration of textFields controller
  TextEditingController _emailController ,_passwordController ;

  //declaration of focusNode
  FocusNode _emailFocus ,_passwordFocus ;

  // formKey form preserve form state
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false ;

  //declaration of AuthenticationController for api calling

  AuthenticationController _authController ;

  //declaration of ProgressDialog
  ProgressDialog pr ;



  @override
  void initState() {
    // initialise the textField controllers
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    // initialise the focusNodes

    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();

    // initialise the AuthenticationController
    _authController = AuthenticationController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    // initialise the progress Dialog

    pr = ProgressDialog(context,isDismissible: false);
    pr.style(
        message: '   Please wait..',
        borderRadius: 1.0,
        backgroundColor: Colors.blue[200],
        progressWidget: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),strokeWidth: 0.5,),
        elevation: 10.0,
        insetAnimCurve: Curves.bounceInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 12.0.sp, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 15.0.sp, fontWeight: FontWeight.w600)
    );
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 3.0.h),
        child: loginFormWidget(),
      ),
    );
  }

  // login form main widget
  loginFormWidget(){
    return Form(
      key: _formKey, // assign form key
      child: ListView(
        children: [
          TextFormField(

            controller: _emailController,
            focusNode: _emailFocus,
            keyboardType: TextInputType.text,

            decoration: InputDecoration(
              helperText: "",

              prefixIcon: IconButton(
                icon: Image.asset("assets/Mail.png",height: 20.0,width: 20.0,),
                onPressed: (){},
              ),
              hintText: 'Email',
              hintStyle: TextStyle(fontSize: 14.0.sp,color: Colors.blue),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                    color: Colors.transparent
                ),
              ),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(60),borderSide: BorderSide(width: 0.7, color: Colors.blue[100])),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(60),borderSide: BorderSide(width: 1, color: Colors.blue)),
              filled: true,
              // contentPadding: EdgeInsets.only(top: 0,bottom:0.0,left: 0.0,right: 0.0),
              contentPadding: EdgeInsets.all(16.0),
              fillColor: Colors.white,

            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (value){
              changeFocusNode(context:context,currentFocusNode: _emailFocus,nextFocusNode: _passwordFocus);
            },
            // validate the value
            validator: (value){
              if(value.isEmpty){
                return "Please enter email." ;
              }else if(!RegExp(StringConst.emailRegx).hasMatch(value)){
                return "Please enter valid email." ;

              }

              return null ;
            },
          ),

          SizedBox(height: 2.0.h,),
          TextFormField(
            obscureText: isPasswordVisible,
            controller: _passwordController,
            focusNode: _passwordFocus,


            keyboardType: TextInputType.text,

            decoration: InputDecoration(
              helperText: "",

              prefixIcon: IconButton(
                icon: Image.asset("assets/Password.png",height: 20.0,width: 20.0,),
                onPressed: (){},
              ),
              suffixIcon:IconButton(
                icon: Image.asset(!isPasswordVisible?"assets/Hide.png":"assets/UnHide.png",height: 20.0,width: 20.0,),
                onPressed: (){
                  setState(() {
                    isPasswordVisible = !isPasswordVisible ;
                  });
                },
              ),
              hintText: 'Password',
              hintStyle: TextStyle(fontSize: 14.0.sp,color: Colors.blue),
              border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(60),

                borderSide: BorderSide(
                  width: 0.0,
                  style: BorderStyle.none,
                  color: Colors.transparent,


                ),

              ),
              // disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(60),borderSide: BorderSide(width: 0.7, color: Colors.blue[100])),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(60),borderSide: BorderSide(width: 1, color: Colors.blue)),
              filled: true,
              // contentPadding: EdgeInsets.only(top: 0,bottom:0.0,left: 0.0,right: 0.0),
              contentPadding: EdgeInsets.all(16.0),
              fillColor: Colors.white,

            ),
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (value){
              _passwordFocus.unfocus();
            },
            // validate the value

            validator: (value){
              if(value.isEmpty){
                return "Please enter password." ;
              }else if(value.length <8){
                return "Please enter at least eight character long password." ;

              }

              return null ;
            },
          ),

          SizedBox(height: 1.0.h,),
          Align(
              alignment: Alignment.centerRight,
              child: Text("Forgot Password ?",textAlign: TextAlign.right,style: TextStyle(fontSize: 14.0.sp,color: Colors.blue),)),

          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 5.0.h),
            child: CustomButton(
              btnText: "Login",
              onPress: () async {

                if(_formKey.currentState.validate()){
                  FocusScope.of(context).unfocus(); // close the keyboard if it is open

                  // check internet connectivity
                  Connectivity().checkConnectivity().then((connectivityResult ){
                    if(connectivityResult != ConnectivityResult.none){
                      pr.show(); // show progress dialog

                      // call login api
                      _authController.login(loginRequest:LoginRequest(email: _emailController.text,password: _passwordController.text,deviceToken: "asdasd",deviceType: Platform.isAndroid?"A":"i",categoryId: 1)).then((loginResponse){
                        pr.hide();  // hide progress dialog

                        if(loginResponse!=null){
                          if(loginResponse.errorMessage == ""){
                            // store isLogged value in shared preference
                            PreferenceHelper().setIsLogged(isLogged: true);
                            // show toast for success message
                            Toast.show("Login successfully", context, textColor: Colors.white, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.blue[200], backgroundRadius: 0.0);
                            //navigate to home screen
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

                          }else{
                            // show toast for error message

                            Toast.show(loginResponse.errorMessage, context, textColor: Colors.white, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.blue[200], backgroundRadius: 0.0);


                          }
                        }

                      });


                    }else{
                      // show toast for internet not available

                      Toast.show("No Internet Connection", context, textColor: Colors.white, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.blue[200], backgroundRadius: 0.0);

                    }
                  });

                }
                // await pr.hide();

              },
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 3.0.h, bottom: 8.0.h),

            child: Center(
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        letterSpacing: 0.1,
                        fontSize: 12.0.sp,
                        color: Colors.blue,
                      ),
                      children: [
                        TextSpan(text: '''Don't have an account?'''),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.blue,
                              fontSize: 12.0.sp),),

                        // if user pressed the sign up then navigate to sign up tab
                        TextSpan(
                            text: 'Sign up'.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.blue,
                                fontSize: 12.0.sp),recognizer: TapGestureRecognizer()..onTap=()=>widget.signUpPressed() ),
                      ])),
            ),
          ),

        ],
      ),
    );
  }

  // This method for change focus of textField by pressing onSubmit button on keyboard
  void changeFocusNode({BuildContext context ,FocusNode currentFocusNode ,FocusNode nextFocusNode}){
    currentFocusNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocusNode);
  }
}
