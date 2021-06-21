

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zignuts_app/views/register_page.dart';

import 'login_page.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> with SingleTickerProviderStateMixin  {
  TabController _controller;
  int _selectedIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>() ;


  @override
  void initState() {
    // TODO: implement initState
    _controller = TabController(length: 2, vsync: this);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body:authenticationMainWidget() ,
    );
  }

  authenticationMainWidget(){
    return Column(
      children: [
        Container(
          height: 35.0.h,
          width: 100.0.w,
          child: Stack(
            fit: StackFit.expand,

            children: [
              Image.asset("assets/splash.png",fit: BoxFit.cover,colorBlendMode: BlendMode.darken,color: Colors.blue,),
              Positioned(
                  left: 22.0.w,
                  right:  20.0.w,
                  top: 15.0.h,
                  child: Text("element3",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40.0.sp),)),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child:  TabBar(

                    unselectedLabelColor: Colors.white,
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    indicatorWeight: 5.0,
                    labelStyle: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                    tabs: [
                      Tab(
                        text: 'Login',

                      ),
                      Tab(
                        text: 'Sign Up',
                      )
                    ],
                    controller: _controller,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),)
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            children: [
              LoginPage(signUpPressed: (){
                print("SignUp button pressed");
                setState(() {
                  _controller.index = 1 ;
                });
              },),
              RegisterPage(),            ],
            controller: _controller,
          ),
        ),
      ],
    );
  }
}
