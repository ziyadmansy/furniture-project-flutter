import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'auth_screens.dart/auth_choice_Screen.dart';

class IntroScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/introScreen';
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool _isPagesLoading = true;
  List<PageViewModel> pages = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      _isPagesLoading = true;
    });
    Future.delayed(
      Duration.zero,
      () {
        pages = [
          introPage(
            title: 'Welcome',
            body: 'Welcome to our Furniture App Introduction Page',
            color: Colors.white,
            imgAssetUrl: 'assets/images/intro1.jpeg',
          ),
          introPage(
            title: 'Welcome',
            body: 'Welcome to our Furniture App Introduction Page',
            color: Colors.white,
            imgAssetUrl: 'assets/images/intro2.jpeg',
          ),
          introPage(
            title: 'Welcome',
            body: 'Welcome to our Furniture App Introduction Page',
            color: Colors.white,
            imgAssetUrl: 'assets/images/intro3.jpeg',
          ),
        ];
        setState(() {
          _isPagesLoading = false;
        });
      },
    );
  }

  PageViewModel introPage({
    String title,
    String body,
    Color color,
    String imgAssetUrl,
  }) {
    return PageViewModel(
      title: title,
      body: body,
      decoration: PageDecoration(
        titlePadding: const EdgeInsets.all(8),
        imageAlignment: Alignment.center,
      ),
      image: Center(
        child: Image.asset(
          imgAssetUrl,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isPagesLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : IntroductionScreen(
            pages: this.pages,
            onDone: () {
              Navigator.of(context)
                  .pushReplacementNamed(AuthChoiceScreen.ROUTE_NAME);
            },
            showSkipButton: true,
            showNextButton: true,
            showDoneButton: true,
            skip: const Text("Skip"),
            next: const Text("Next"),
            done: const Text("Done"),
            initialPage: 0,
          );
  }
}
