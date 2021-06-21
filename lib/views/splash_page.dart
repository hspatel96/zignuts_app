
import 'package:flutter/material.dart';
import 'package:zignuts_app/helper/preference_helper.dart';

import 'authentication_screen.dart';
import 'authentication_screen.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState

    // get value of isLogged for check user already login or not and based on that navigate to appropriate screen
  PreferenceHelper().getIsLogged().then((isLogged){
    Future.delayed(Duration(seconds:3 ),(){
      if(isLogged != null && isLogged){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthenticationScreen()));

      }
    });

  });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // below widget render the spash image into entire screen
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/splash.png",fit: BoxFit.cover,)
        ],
      ),
    );
  }
}
