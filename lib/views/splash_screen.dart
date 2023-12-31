


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grip/utils/NotificationService.dart';
import 'package:grip/utils/global_variables.dart';
import 'package:grip/utils/gripUtils.dart';
import 'package:grip/views/appIntroPage.dart';
import 'package:grip/views/home_page.dart';
import 'package:grip/views/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../webservice/api_constants.dart';

class SplashScreenPage extends StatefulWidget {

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final _messagingService = MessagingService();
  @override
  void initState() {
    super.initState();
    _messagingService.init(context);
    startSplashScreen();
  }

  startSplashScreen() async {
    var introStatus = await getAppIntroStatus();


    var loginStatus = await getLoginStatus();
    GlobalVariables.userId=loginStatus;
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {

      if (loginStatus == "") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) =>
              LoginActivity()),
        );
      }
      else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) =>
              HomePage()),
        );
      }

/*
      if(introStatus){
        if (loginStatus == "") {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) =>
                LoginActivity()),
          );
        }
        else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) =>
                HomePage()),
          );
        }

      }
      else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            return AppIntroPage();
          }),
        );



      }
*/


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
    // await prefs.setString("firstName", "SALIN");
    // await prefs.setString("email", "a@b.com");
    // await prefs.setString("userId", "1");

    bool token = (prefs.getBool('appIntro') ?? false);
    return token;
  }

  Future<String> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('userId') ?? "");
    return token;
  }

}