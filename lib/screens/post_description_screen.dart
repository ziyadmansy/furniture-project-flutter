import 'package:flutter/material.dart';
import 'package:furniture_app/utils/constants.dart';

class PostsDescriptionScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/postDescriptionScreen';
  @override
  _PostsDescriptionScreenState createState() => _PostsDescriptionScreenState();
}

class _PostsDescriptionScreenState extends State<PostsDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Description'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://azcd.domayne.com.au/media/catalog/category/cache/25/image/1260x/17f82f742ffe127f42dca9de82fb58b1/gp1022021-furniture-hero_1.jpg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Post Title',
                  style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras semper ac urna sit amet consequat. Sed et ipsum lectus. Pellentesque non orci nec dolor congue sagittis eget ut metus. Nunc mollis lorem vitae metus imperdiet suscipit. Vestibulum ac auctor mauris. Maecenas feugiat est at quam porttitor, et gravida tellus mattis. Nullam arcu nulla, facilisis vitae risus vel, viverra aliquet sem. Donec eget euismod tortor, vel finibus orci. Nulla sodales nisi nisi, quis consequat velit pellentesque a. Donec ex orci, tempus non accumsan ut, vulputate nec magna. Pellentesque sit amet suscipit ex. Morbi tincidunt, risus id accumsan dapibus, urna lectus dapibus ante, ultrices ornare augue lacus dictum orci. Morbi elementum elit vel leo tincidunt commodo.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
