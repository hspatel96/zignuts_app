import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:zignuts_app/helper/preference_helper.dart';

import 'authentication_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout,color: Colors.white,size: 20.0,),
        onPressed: (){
          // delete islogged value from preference
          PreferenceHelper().deleteIsLogged();
          //show toast for logout
          Toast.show("User Logout successfully", context, textColor: Colors.white, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.blue[200], backgroundRadius: 0.0);
          //navigate back to authentication screen
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthenticationScreen()));

        },
      ),

    );
  }
}
