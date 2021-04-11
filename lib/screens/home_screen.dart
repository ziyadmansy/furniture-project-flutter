import 'package:flutter/material.dart';
import 'package:furniture_app/screens/cart_screen.dart';
import 'package:furniture_app/screens/home_page_screens.dart/home_page.dart';
import 'package:furniture_app/screens/home_page_screens.dart/profile_page.dart';
import 'package:furniture_app/screens/home_page_screens.dart/settings_page.dart';
import 'package:furniture_app/screens/home_page_screens.dart/trending_page.dart';
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
        'title': 'Home',
        'body': HomePage(),
      },
      {
        'title': 'Trending',
        'body': TrendingPage(),
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
        title: Text(_bodyPages[_currentIndex]['title']),
      ),
      drawer: NavDrawer(),
      body: _bodyPages[_currentIndex]['body'],
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
                icon: Icon(Icons.home),
                color: _currentIndex == 0 ? mainColor : Colors.grey,
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.trending_up),
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
      floatingActionButton: Container(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          child: Icon(
            Icons.shopping_cart_rounded,
            color: Colors.yellowAccent[100],
            size: 32,
          ),
          backgroundColor: mainColor,
          onPressed: () {
            Navigator.of(context).pushNamed(CartScreen.ROUTE_NAME);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
