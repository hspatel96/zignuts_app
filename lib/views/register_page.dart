

import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:sizer/sizer.dart';
import 'package:toast/toast.dart';
import 'package:zignuts_app/constants/string_constant.dart';
import 'package:zignuts_app/helper/preference_helper.dart';

import '../controllers/authentication_controller.dart';
import '../model/request/signUp_request.dart';
import 'home_page.dart';
import 'widgets/custom_button.dart';

class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //declaration of textFields controller
  TextEditingController _emailController ,_passwordController,_fNameController,_lNameController,_confirmPwdController ;

  //declaration of focusNodes
  FocusNode _emailFocus ,_passwordFocus ,_fNameFocus,_lNameFocus,_confirmPwdFocus ;


  // formKey form preserve form state
  final _formKey = GlobalKey<FormState>();

  // initialise the boolean variables
  bool isPasswordVisible = false ;
  bool isConfirmPasswordVisible = false ;
  bool isPrivacyChecked = false ;

  //declaration of AuthenticationController for api calling
  AuthenticationController _authController ;

  //declaration of ProgressDialog
  ProgressDialog pr ;




  @override
  void initState() {
    // initialise the textField controllers

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _fNameController = TextEditingController();
    _lNameController = TextEditingController();
    _confirmPwdController = TextEditingController();

    // initialise the focusNodes

    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();
    _fNameFocus = FocusNode();
    _lNameFocus = FocusNode();
    _confirmPwdFocus = FocusNode();

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
        child: registerFormWidget(),
      ),
    );
  }


  // register form main widget
  registerFormWidget(){
    return Form(
      key: _formKey, // assign form key
      child: ListView(
        children: [
          TextFormField(

            controller: _fNameController,
            focusNode: _fNameFocus,
            keyboardType: TextInputType.text,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
            ],
            decoration: InputDecoration(
              helperText: "",

              prefixIcon: IconButton(
                icon: Image.asset("assets/First Name.png",height: 20.0,width: 20.0,),
                onPressed: (){},
              ),
              hintText: 'First name',
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
              changeFocusNode(context:context,currentFocusNode: _fNameFocus,nextFocusNode: _lNameFocus);
            },

            // validate the value

            validator: (value){
              if(value.isEmpty){
                return "Please enter first name." ;
              }

              return null ;
            },
          ),

          SizedBox(height: 2.0.h,),

          TextFormField(

            controller: _lNameController,
            focusNode: _lNameFocus,
            keyboardType: TextInputType.text,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
            ],
            decoration: InputDecoration(
              helperText: "",

              prefixIcon: IconButton(
                icon: Image.asset("assets/First Name.png",height: 20.0,width: 20.0,),
                onPressed: (){},
              ),
              hintText: 'Last name',
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
              changeFocusNode(context:context,currentFocusNode: _lNameFocus,nextFocusNode: _emailFocus);
            },
            // validate the value

            validator: (value){
              if(value.isEmpty){
                return "Please enter last name." ;
              }

              return null ;
            },
          ),
          SizedBox(height: 2.0.h,),

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
              /*  suffixIcon:IconButton(
                    icon: Image.asset(!isPasswordVisible?"assets/Hide.png":"assets/UnHide.png",height: 20.0,width: 20.0,),
                    onPressed: (){
                      setState(() {
                        isPasswordVisible = !isPasswordVisible ;
                      });
                    },
                  ),*/
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
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (value){
              changeFocusNode(context:context,currentFocusNode: _passwordFocus,nextFocusNode: _confirmPwdFocus);
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
          SizedBox(height: 2.0.h,),

          TextFormField(
            obscureText: isPasswordVisible,
            controller: _confirmPwdController,
            focusNode: _confirmPwdFocus,


            keyboardType: TextInputType.text,

            decoration: InputDecoration(
              helperText: "",

              prefixIcon: IconButton(
                icon: Image.asset("assets/Password.png",height: 20.0,width: 20.0,),
                onPressed: (){},
              ),
              /*   suffixIcon:IconButton(
                    icon: Image.asset(!isConfirmPasswordVisible?"assets/Hide.png":"assets/UnHide.png",height: 20.0,width: 20.0,),
                    onPressed: (){
                      setState(() {
                        isConfirmPasswordVisible = !isConfirmPasswordVisible ;
                      });
                    },
                  ),*/
              hintText: 'Confirm Password',
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
              _confirmPwdFocus.unfocus();
            },

            // validate the value
            validator: (value){
              if(value.isEmpty){
                return "Please enter confirm password." ;
              }else if(_passwordController.text != _confirmPwdController.text){
                return "Password and confirm password does not match." ;

              }

              return null ;
            },
          ),

          SizedBox(height: 1.0.h,),
          Container(
            margin: EdgeInsets.only(top: 0.0.h, bottom: 5.0.h),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                InkWell(

                  child: Image.asset(
                    isPrivacyChecked ? "assets/selected.png" : "assets/Unselected.png",
                    height: 5.0.h,
                    width: 5.0.w,
                  ),
                  onTap: (){
                    setState(() {
                      // after click on checkbox it's assign the value to the variable
                      isPrivacyChecked = !isPrivacyChecked ;
                    });
                  },
                ),
                SizedBox(
                  width: 2.0.w,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Text.rich(
                          TextSpan(
                              text: "I hearby accept the ",
                              style: TextStyle(
                                fontSize: 11.5.sp,
                                color: Colors.blue,
                              ),
                              children: [
                                TextSpan(text: "Terms and Conditions\n",style: TextStyle(
                                  fontSize: 11.5.sp,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,),recognizer: TapGestureRecognizer()..onTap=() {},
                                ),
                                TextSpan(text: "and have read the",style: TextStyle(
                                  fontSize: 11.5.sp,
                                  color: Colors.blue,
                                ),),
                                TextSpan(text: " Privacy Policy",style: TextStyle(
                                  fontSize: 11.5.sp,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic

                                  ,),recognizer: TapGestureRecognizer()..onTap=(){},),
                              ]

                          )
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 0.0.h),
            child: CustomButton(
              btnText: "Sign Up",
              onPress: () async {

                if(_formKey.currentState.validate()){
                  FocusScope.of(context).unfocus(); // close the keyboard if it is open

                  if(isPrivacyChecked){

                    Connectivity().checkConnectivity().then((connectivityResult ){
                      if(connectivityResult != ConnectivityResult.none){
                        pr.show(); // show progress dialog

                        // call register api
                        _authController.signUp(SignUpRequestModel(firstName: _fNameController.text,lastName: _lNameController.text,email:_emailController.text,password: _passwordController.text,confirmPassword: _confirmPwdController.text,deviceToken: "asdasd",deviceType: Platform.isAndroid?"A":"i")).then((signUpResponse){
                          pr.hide(); // hide progress dialog

                          if(signUpResponse!=null){
                            if(signUpResponse.errorMessage == ""){

                              // store isLogged value in shared preference
                              PreferenceHelper().setIsLogged(isLogged: true);

                              // show toast for success message
                              Toast.show("User register successfully", context, textColor: Colors.white, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.blue[200], backgroundRadius: 0.0);

                              //navigate to home screen
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

                            }else{
                              // show toast for error message

                              Toast.show(signUpResponse.errorMessage, context, textColor: Colors.white, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.blue[200], backgroundRadius: 0.0);

                            }
                          }

                        });
                      }else{
                        // show toast for internet not available

                        Toast.show("No Internet Connection", context, textColor: Colors.white, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.blue[200], backgroundRadius: 0.0);

                      }
                    });
                  }else{
                    // show toast for if user not accept the terms and cond. and privacy policy

                    Toast.show("Please accept the terms and conditions and privacy policy", context, textColor: Colors.white, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.blue[200], backgroundRadius: 0.0);

                  }

                  /* if(isRememberMe){
                        initConnectivity();
                      }else{
                        Toast.show("Please accept the terms and conditions and privacy policy", context, textColor: Colors.black, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.white, backgroundRadius: 0.0);
                      }*/
                }
                // await pr.hide();

              },
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
