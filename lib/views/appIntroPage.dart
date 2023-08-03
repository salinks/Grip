

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grip/utils/global_variables.dart';
import 'package:grip/utils/gripUtils.dart';
import 'package:grip/views/home_page.dart';
import 'package:grip/views/login_page.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppIntroPage extends StatefulWidget {

  const AppIntroPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<AppIntroPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Future<void> _onIntroEnd(context) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("appIntro", true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) =>
          LoginActivity()),
    );
  }


  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('./assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color.fromRGBO(107, 218, 212, 1.0),
      imagePadding: EdgeInsets.fromLTRB(0.0,70.0, 0.0, 0.0),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor:  GripUtils().parseColor("#6bdad4"),
      allowImplicitScrolling: false,
      autoScrollDuration: 3000,
      infiniteAutoScroll: false,




      pages: [
        PageViewModel(
          title: "Intro Page Title 1",
          body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi faucibus, erat a scelerisque malesuada",
          image: _buildImage('img1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Intro Page Title 2",
          body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi faucibus, erat a scelerisque malesuada",
          image: _buildImage('img2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Intro Page Title 3",
          body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi faucibus, erat a scelerisque malesuada",
          image: _buildImage('img3.png'),
          decoration: pageDecoration,
        ),



      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back,color: Colors.white),
      skip: const Text('SKIP', style: TextStyle(color:Colors.white,fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward,color: Colors.white),
      done: const Text('GET STARTED', style: TextStyle(color:Colors.white,fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color.fromRGBO(255, 255, 255, 1.0),
        activeSize: Size(22.0, 10.0),
        activeColor: Color.fromRGBO(170, 25, 94, 1.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),

        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color:  Color.fromRGBO(107, 218, 212, 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }




}