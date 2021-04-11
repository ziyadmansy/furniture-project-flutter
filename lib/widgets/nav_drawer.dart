import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                child: Text(
                  'Furniture',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
            ListTile(
              title: Text('Contact Support'),
              leading: Icon(Icons.contact_support_outlined),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text('Credits'),
              leading: Icon(Icons.recent_actors_outlined),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                            'Aya Abd El-Aziz',
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
                            'Mohammad Shokr',
                            style: TextStyle(
                              fontSize: 10,
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
                  applicationIcon: FlutterLogo(),
                  applicationName: 'Furniture',
                  applicationVersion: '1.0.0',
                  applicationLegalese:
                      '© copyright 2021 furniture.com. All other trademarks and copyrights are the property of their respective owners. All rights reserved.',
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text('Exit'),
              leading: Icon(Icons.exit_to_app_outlined),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
