import 'package:flutter/material.dart';
import 'package:furniture_app/screens/splash_screen.dart';

Map<String, Widget Function(BuildContext context)> appRoutes() {
  return {
    SplashScreen.ROUTE_NAME: (context) => SplashScreen(),
  };
}
