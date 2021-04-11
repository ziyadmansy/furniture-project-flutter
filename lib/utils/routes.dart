import 'package:flutter/material.dart';
import 'package:furniture_app/screens/auth_screens.dart/auth_choice_screen.dart';
import 'package:furniture_app/screens/auth_screens.dart/signin_screen.dart';
import 'package:furniture_app/screens/auth_screens.dart/signup_screen.dart';
import 'package:furniture_app/screens/cart_screen.dart';
import 'package:furniture_app/screens/home_screen.dart';
import 'package:furniture_app/screens/intro_screen.dart';
import 'package:furniture_app/screens/splash_screen.dart';

Map<String, Widget Function(BuildContext context)> appRoutes() {
  return {
    SplashScreen.ROUTE_NAME: (context) => SplashScreen(),
    IntroScreen.ROUTE_NAME: (context) => IntroScreen(),
    AuthChoiceScreen.ROUTE_NAME: (context) => AuthChoiceScreen(),
    SignUpScreen.ROUTE_NAME: (context) => SignUpScreen(),
    SignInScreen.ROUTE_NAME: (context) => SignInScreen(),
    HomeScreen.ROUTE_NAME: (context) => HomeScreen(),
    CartScreen.ROUTE_NAME: (context) => CartScreen(),
  };
}
