import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/imageScreen';

  final String id;

  const ImageScreen(this.id);
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Center(
          child: Hero(
            tag: widget.id,
            child: Image.network(
              'https://azcd.domayne.com.au/media/catalog/category/cache/25/image/1260x/17f82f742ffe127f42dca9de82fb58b1/gp1022021-furniture-hero_1.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
