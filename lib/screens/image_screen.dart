import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/imageScreen';

  final String id;
  final String imgUrl;

  const ImageScreen(this.id, this.imgUrl);
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
              widget.imgUrl,
            ),
          ),
        ),
      ),
    );
  }
}
