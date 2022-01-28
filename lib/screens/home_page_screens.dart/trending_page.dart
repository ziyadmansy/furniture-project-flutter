import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/providers/posts.dart';
import 'package:furniture_app/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../image_screen.dart';
import '../post_description_screen.dart';

class TrendingPage extends StatefulWidget {
  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  int _selectedChip = 0;
  bool _isLoading = false;
  bool _hasCrashed = false;

  @override
  void initState() {
    super.initState();
    // getTrendings();
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Toast.show(
        'Couldn\'t Launch',
        context,
        backgroundColor: redColor,
        textColor: Colors.white,
      );
    }
  }

  Future<void> getTrendings() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Posts>(context, listen: false).getTrendings();
      setState(() {
        _isLoading = false;
        _hasCrashed = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _hasCrashed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final postsData = Provider.of<Posts>(context, listen: true);
    return _isLoading
        ? Center(
            child: appLoader,
          )
        : _hasCrashed
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.warning_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      INTERNET_WARNING_MESSAGE,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    FlatButton(
                      onPressed: getTrendings,
                      child: const Text(
                        'Retry',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: postsData.trendings.length,
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
                          Navigator.of(context).pushNamed(
                            PostsDescriptionScreen.ROUTE_NAME,
                            arguments: postsData.trendings[i],
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  postsData.trendings[i].title,
                                  style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                subtitle: Text(
                                  'Posted on ${postsData.trendings[i].date.day}/${postsData.trendings[i].date.month}/${postsData.trendings[i].date.year}' +
                                      '\nTrending #${i + 1} on Modern Furniture Home!',
                                ),
                                isThreeLine: true,
                              ),
                              Container(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) {
                                          return ImageScreen(
                                            '${postsData.trendings[i].id}',
                                            postsData.trendings[i].imgUrl,
                                          );
                                        },
                                      ));
                                    },
                                    child: Hero(
                                      tag: '${postsData.trendings[i].id}',
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            kBorderRadius),
                                        child: Image.network(
                                          postsData.trendings[i].imgUrl,
                                          width: screenWidth,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextButton.icon(
                                      onPressed: () {
                                        _launchUrl(postsData.trendings[i].link);
                                      },
                                      label: Text('Vist'),
                                      icon: Icon(Icons.link),
                                    ),
                                  ),
                                  VerticalDivider(),
                                  Expanded(
                                    child: TextButton.icon(
                                      onPressed: () async {
                                        await _launchUrl('tel:01023843232');
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
