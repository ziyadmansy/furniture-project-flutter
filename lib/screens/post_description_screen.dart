import 'package:flutter/material.dart';
import 'package:furniture_app/models/post.dart';
import 'package:furniture_app/utils/constants.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/product.dart';
import '../widgets/custom_dialogs.dart';

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
      errorDialog(
        context: context,
        title: 'Error',
        body: 'Something went wrong!',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final post = ModalRoute.of(context).settings.arguments as Post;
    return Scaffold(
      appBar: AppBar(
        title: Text(post.postTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  post.imgUrl,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  post.postTitle,
                  style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              Text(
                post.postBody,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 48,
                width: screenWidth,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.shopping_bag),
                  label: Text('Add to Cart'),
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
