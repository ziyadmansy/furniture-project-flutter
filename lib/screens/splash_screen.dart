import 'package:flutter/material.dart';
import 'package:furniture_app/screens/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/splashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () {
        Navigator.of(context).pushReplacementNamed(IntroScreen.ROUTE_NAME);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/chair_icon.png',
          width: screenWidth / 2,
          height: screenWidth / 2,
        ),
      ),
    );
  }
}
