import 'package:flutter/material.dart';
import 'package:furniture_app/screens/auth_screens.dart/auth_choice_screen.dart';
import 'package:furniture_app/utils/constants.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/chair_icon.png',
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Furniture Home'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('Team Members'),
              leading: Icon(Icons.recent_actors_outlined),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Team Members',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: mainColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            'Ziyad Mansy',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          Divider(),
                          Text(
                            'Abd El-Rahman Ezzat',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          Divider(),
                          Text(
                            'Ahmed Ayman',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          Divider(),
                          Text(
                            'Mostafa',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          Divider(),
                          Text(
                            'Mahmoud Sabry',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          Divider(),
                          Text(
                            'Aya Mohammad',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          Divider(),
                          Text(
                            'Demiana Moheb',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          Divider(),
                          Text(
                            'Fatma Salah',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          Divider(),
                          Text(
                            'Maha Mahmoud',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text('License'),
              leading: Icon(Icons.info_outline),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationIcon: Image.asset(
                    'assets/images/chair_icon.png',
                    width: 60,
                    height: 60,
                  ),
                  applicationName: 'Furniture Home',
                  applicationVersion: '1.0.0',
                  applicationLegalese:
                      '© copyright 2021 furniture.com. All other trademarks and copyrights are the property of their respective owners. All rights reserved.',
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.exit_to_app_outlined),
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AuthChoiceScreen.ROUTE_NAME, (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
