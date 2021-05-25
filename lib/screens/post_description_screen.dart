import 'package:flutter/material.dart';
import 'package:furniture_app/models/post.dart';
import 'package:furniture_app/utils/constants.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class PostsDescriptionScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/postDescriptionScreen';
  @override
  _PostsDescriptionScreenState createState() => _PostsDescriptionScreenState();
}

class _PostsDescriptionScreenState extends State<PostsDescriptionScreen> {
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final postData = ModalRoute.of(context).settings.arguments as Post;
    return Scaffold(
      appBar: AppBar(
        title: Text(postData.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  postData.imgUrl,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  postData.title,
                  style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              Text(
                postData.body.replaceAll('<p>', '').replaceAll('</p>', ''),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 48,
                width: screenWidth,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _launchUrl(postData.link);
                  },
                  icon: Icon(Icons.link),
                  label: Text('Visit'),
                  style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
