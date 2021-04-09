import 'package:flutter/material.dart';
import 'package:furniture_app/screens/splash_screen.dart';
import 'package:furniture_app/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.lightBlueAccent,
      ),
      home: SplashScreen(),
      routes: appRoutes(),
    );
  }
}