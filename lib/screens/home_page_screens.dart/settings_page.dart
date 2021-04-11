import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_app/providers/theme_provider.dart';
import 'package:furniture_app/utils/constants.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeProvider>(context);
    return ListView(
      children: [
        SwitchListTile(
          title: Text('Dark Mode'),
          value: themeData.isDarkMode,
          onChanged: (checked) {
            setState(() {
              themeData.toggleDarkMode(checked);
            });
          },
        ),
        Divider(),
        ListTile(
          title: Text('Contact Support'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text('Credits'),
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
          onTap: () {
            SystemNavigator.pop();
          },
        ),
      ],
    );
  }
}
