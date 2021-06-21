

import 'package:flutter/material.dart';
import 'package:sizer/sizer_util.dart';
import 'package:zignuts_app/views/splash_page.dart';

class ZignutsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {

            // inialise the sizer plugin class for responsive Ui
            SizerUtil().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Zignuts',
              theme: ThemeData(

                primarySwatch: Colors.blue,
              ),
              home: SplashPage(), // return splashPage as a home widget
            );
          }
        );
      }
    );
  }
}