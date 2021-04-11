import 'package:flutter/material.dart';
import 'package:furniture_app/screens/home_page_screens.dart/home_page.dart';
import 'package:furniture_app/screens/home_page_screens.dart/profile_page.dart';
import 'package:furniture_app/screens/home_page_screens.dart/settings_page.dart';
import 'package:furniture_app/screens/home_page_screens.dart/trending_page.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 16,
        backgroundColor: Colors.grey[900],
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
