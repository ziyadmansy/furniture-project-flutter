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
    // TODO: implement initState
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FlutterLogo(),
            Text('Our Logo here'),
          ],
        ),
      ),
    );
  }
}
