import 'package:flutter/material.dart';
import 'package:furniture_app/enums/gender.dart';
import 'package:furniture_app/providers/auth.dart';
import 'package:furniture_app/screens/auth_screens.dart/signin_screen.dart';
import 'package:furniture_app/utils/constants.dart';
import 'package:provider/provider.dart';

import '../home_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/signUpScreen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List<bool> _userTypes = [false, false];
  Gender _gender = Gender.male;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> register() async {
    try {
      final authData = Provider.of<Auth>(context, listen: false);
      await authData.register(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        gender: _gender,
        age: ageController.text,
        email: emailController.text,
        password: passwordController.text,
        isCustomer: _userTypes[0],
      );

      Navigator.of(context).pushReplacementNamed(HomeScreen.ROUTE_NAME);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error Ocurred'),
        ),
      );
    }
  }

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
                        'Sign Up'.toUpperCase(),
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
                    ToggleButtons(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: Center(
                              child: const Text('Customer'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: Center(
                              child: const Text('Designer'),
                            ),
                          ),
                        ),
                      ],
                      isSelected: _userTypes,
                      onPressed: (int i) {
                        setState(() {
                          for (int j = 0; j < _userTypes.length; j++) {
                            if (j == i) {
                              _userTypes[j] = true;
                            } else {
                              _userTypes[j] = false;
                            }
                          }
                        });
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: firstNameController,
                            decoration: InputDecoration(
                              hintText: 'First Name',
                              labelText: 'First Name',
                              enabledBorder: kEnabledBorder,
                              focusedBorder: kFocusedBorder,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: lastNameController,
                            decoration: InputDecoration(
                              hintText: 'Last Name',
                              labelText: 'Last Name',
                              enabledBorder: kEnabledBorder,
                              focusedBorder: kFocusedBorder,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: ageController,
                      decoration: InputDecoration(
                        hintText: 'Age',
                        labelText: 'Age',
                        enabledBorder: kEnabledBorder,
                        focusedBorder: kFocusedBorder,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: emailController,
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
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        enabledBorder: kEnabledBorder,
                        focusedBorder: kFocusedBorder,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        labelText: 'Confirm Password',
                        enabledBorder: kEnabledBorder,
                        focusedBorder: kFocusedBorder,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    RadioListTile(
                      value: Gender.male,
                      groupValue: _gender,
                      title: Text('Male'),
                      contentPadding: const EdgeInsets.all(0),
                      onChanged: (Gender pickedGender) {
                        setState(() {
                          _gender = pickedGender;
                        });
                      },
                    ),
                    RadioListTile(
                      value: Gender.female,
                      groupValue: _gender,
                      title: Text('Female'),
                      contentPadding: const EdgeInsets.all(0),
                      onChanged: (Gender pickedGender) {
                        setState(() {
                          _gender = pickedGender;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: register,
                        child: Text('Register'),
                        style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                          ),
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
                        child: Text('Already have an account? Sign in'),
                        style: TextButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(SignInScreen.ROUTE_NAME);
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
