import 'package:flutter/foundation.dart';

class Post {
  final int id;
  final String imgUrl;
  final String link;
  final String title;
  final String body;
  final DateTime date;

  Post({
    @required this.id,
    @required this.link,
    @required this.title,
    @required this.body,
    @required this.imgUrl,
    @required this.date,
  });
}
