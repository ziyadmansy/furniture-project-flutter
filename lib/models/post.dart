import 'package:flutter/foundation.dart';

class Post {
  final int postId;
  final String postTitle;
  final String postBody;
  final String publishedDate;
  final int designerId;
  final String imgUrl;

  Post({
    @required this.postId,
    @required this.postTitle,
    @required this.postBody,
    @required this.publishedDate,
    @required this.designerId,
    @required this.imgUrl,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['post_id'] as int,
      postTitle: json['post_title'] as String,
      postBody: json['post_body'] as String,
      publishedDate: json['published_date'] as String,
      designerId: json['designer_id'] as int,
      imgUrl: (json['img_url'] as String) ??
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/amazon-rivet-furniture-1533048038.jpg?crop=1.00xw:0.502xh;0,0.423xh&resize=1200:*',
    );
  }
}
