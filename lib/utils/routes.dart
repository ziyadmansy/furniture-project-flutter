import 'package:flutter/material.dart';
import 'package:furniture_app/screens/auth_screen.dart';
import 'package:furniture_app/screens/intro_screen.dart';
import 'package:furniture_app/screens/splash_screen.dart';

Map<String, Widget Function(BuildContext context)> appRoutes() {
  return {
    SplashScreen.ROUTE_NAME: (context) => SplashScreen(),
    IntroScreen.ROUTE_NAME: (context) => IntroScreen(),
    AuthScreen.ROUTE_NAME: (context) => AuthScreen(),
  };
}
