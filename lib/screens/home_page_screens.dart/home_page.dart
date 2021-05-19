import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/screens/image_screen.dart';
import 'package:furniture_app/screens/post_description_screen.dart';
import 'package:furniture_app/utils/constants.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Toast.show(
        'Couldn\'t Call',
        context,
        backgroundColor: redColor,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: 16,
        itemBuilder: (context, i) {
          return Card(
            margin: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            elevation: 8,
            child: InkWell(
              borderRadius: BorderRadius.circular(kBorderRadius),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(PostsDescriptionScreen.ROUTE_NAME);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        i % 2 == 0 ? 'Ziyad Mansy' : 'Scarlet Johanson',
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      subtitle: Text('21 min. ago'),
                    ),
                    Container(
                      height: 175,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, j) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return ImageScreen('$i$j');
                                  },
                                ));
                              },
                              child: Hero(
                                tag: '$i$j',
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(kBorderRadius),
                                  child: Image.network(
                                    'https://azcd.domayne.com.au/media/catalog/category/cache/25/image/1260x/17f82f742ffe127f42dca9de82fb58b1/gp1022021-furniture-hero_1.jpg',
                                    width: 250,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton.icon(
                            onPressed: () {},
                            label: Text('Comments'),
                            icon: FaIcon(FontAwesomeIcons.comments),
                          ),
                        ),
                        VerticalDivider(),
                        Expanded(
                          child: TextButton.icon(
                            onPressed: () async {
                              await _makePhoneCall('tel:01023843232');
                            },
                            label: Text('Contact'),
                            icon: FaIcon(FontAwesomeIcons.phone),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
