import 'package:flutter/material.dart';
import 'package:furniture_app/screens/auth_screens.dart/signin_screen.dart';
import 'package:furniture_app/screens/auth_screens.dart/signup_screen.dart';
import 'package:furniture_app/utils/constants.dart';

class AuthChoiceScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/authChoiceScreen';
  @override
  _AuthChoiceScreenState createState() => _AuthChoiceScreenState();
}

class _AuthChoiceScreenState extends State<AuthChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(
                  flex: 2,
                ),
                const Text(
                  'A new user? Sign Up!',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SignUpScreen.ROUTE_NAME);
                    },
                    child: const Text(
                      'Sign Up',
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                const Text(
                  'Already a member? Sign in!',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SignInScreen.ROUTE_NAME);
                    },
                    child: const Text(
                      'Sign In',
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
