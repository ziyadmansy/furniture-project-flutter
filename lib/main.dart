import 'package:flutter/material.dart';
import 'package:furniture_app/providers/auth.dart';
import 'package:furniture_app/providers/posts.dart';
import 'package:furniture_app/providers/theme_provider.dart';
import 'package:furniture_app/screens/splash_screen.dart';
import 'package:furniture_app/utils/constants.dart';
import 'package:furniture_app/utils/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Posts(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeData, ch) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: !themeData.isDarkMode
                ? ThemeData.light().copyWith(
                    accentColor: Colors.lightBlueAccent[700],
                    primaryColor: mainColor,
                  )
                : ThemeData.dark().copyWith(
                    accentColor: Colors.lightBlueAccent[400],
                    primaryColor: Colors.teal[700],
                  ),
            home: SplashScreen(),
            routes: appRoutes(),
          );
        },
      ),
    );
  }
}
