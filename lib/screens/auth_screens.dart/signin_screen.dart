import 'package:flutter/material.dart';
import 'package:furniture_app/screens/auth_screens.dart/signup_screen.dart';
import 'package:furniture_app/utils/constants.dart';

class SignInScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/signInScreen';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Card(
            margin: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sign In'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: mainColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                        enabledBorder: kEnabledBorder,
                        focusedBorder: kFocusedBorder,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        enabledBorder: kEnabledBorder,
                        focusedBorder: kFocusedBorder,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Login'),
                        style: ElevatedButton.styleFrom(
                          primary: mainColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text('or'),
                    SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: TextButton(
                        child: Text('Don\'t have an account? Sign Up'),
                        style: TextButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(SignUpScreen.ROUTE_NAME);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
