


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grip/utils/gripUtils.dart';
import 'package:grip/views/appIntroPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPage extends StatefulWidget {

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var introStatus = await getAppIntroStatus();
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {


      if(introStatus){

      }
      else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            return AppIntroPage();
          }),
        );
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  GripUtils().parseColor("#f1f3f2"),
      body: Center(
        child: Image.asset(
          "./assets/images/grip_logo.png",
          width: 250.0,
          height: 150.0,
        ),
      ),
    );
  }

  Future<bool> getAppIntroStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool token = (prefs.getBool('appIntro') ?? false);
    return token;
  }
}