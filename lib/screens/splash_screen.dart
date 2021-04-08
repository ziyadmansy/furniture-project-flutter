import 'package:flutter/material.dart';
import 'package:furniture_app/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/splashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Furniture'),
      ),
      body: Center(
        child: Text(
          'Start',
          style: TextStyle(fontSize: 24.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
