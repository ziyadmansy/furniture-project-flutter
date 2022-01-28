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
          title: Text('Team Members'),
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
          title: Text('Project Proposal'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text('Logout'),
          onTap: () {
          },
        ),
      ],
    );
  }
}
