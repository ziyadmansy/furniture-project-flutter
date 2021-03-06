import 'package:flutter/material.dart';
import 'package:furniture_app/screens/cart_screen.dart';
import 'package:furniture_app/screens/home_page_screens.dart/posts_page.dart';
import 'package:furniture_app/screens/home_page_screens.dart/profile_page.dart';
import 'package:furniture_app/screens/home_page_screens.dart/settings_page.dart';
import 'package:furniture_app/screens/home_page_screens.dart/products_page.dart';
import 'package:furniture_app/utils/constants.dart';
import 'package:furniture_app/widgets/nav_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String ROUTE_NAME = 'homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Map<String, Object>> _bodyPages = [];

  @override
  void initState() {
    super.initState();
    _bodyPages = [
      {
        'title': 'Posts',
        'body': PostsPage(),
      },
      {
        'title': 'Products',
        'body': ProductsPage(),
      },
      {
        'title': 'Profile',
        'body': ProfilePage(),
      },
      {
        'title': 'Settings',
        'body': SettingsPage(),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_bodyPages[_currentIndex]['title'] as String),
      ),
      drawer: NavDrawer(),
      body: _bodyPages[_currentIndex]['body'] as Widget,
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        elevation: 16,
        notchMargin: 6,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.feed),
                color: _currentIndex == 0 ? mainColor : Colors.grey,
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.shopify),
                color: _currentIndex == 1 ? mainColor : Colors.grey,
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.account_circle),
                color: _currentIndex == 2 ? mainColor : Colors.grey,
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.menu),
                color: _currentIndex == 3 ? mainColor : Colors.grey,
                onPressed: () {
                  setState(() {
                    _currentIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: Container(
      //   width: 60,
      //   height: 60,
      //   child: FloatingActionButton(
      //     child: Icon(
      //       Icons.shopping_cart_rounded,
      //       color: Colors.teal[50],
      //       size: 32,
      //     ),
      //     backgroundColor: mainColor,
      //     onPressed: () {
      //       Navigator.of(context).pushNamed(CartScreen.ROUTE_NAME);
      //     },
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
