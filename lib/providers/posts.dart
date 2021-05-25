import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:furniture_app/models/post.dart';
import 'package:furniture_app/utils/constants.dart';

class Posts with ChangeNotifier {
  List<Post> posts = [];
  List<Post> trendings = [];
  List<Map<String, dynamic>> media = [];

  Future<void> getPosts() async {
    try {
      final String url = '$API_URL/posts';

      Response response;
      var dio = Dio();

      // await getMedia();
      response = await dio.get(url);

      final List<dynamic> decodedResponseBody = response.data as List<dynamic>;
      print(decodedResponseBody);

      if (response.statusCode >= 400) {
        throw Exception('Status Code >= 400 getPosts');
      }

      posts = decodedResponseBody.map((post) {
        // {
        //     'id': img['id'],
        //     'imgUrl': img['guid']['rendered'],
        //   }
        String imgUrl;
        // int postImgId = post['featured_media'] as int;
        // for (int i = 0; i < media.length; i++) {
        //   if (media[i]['id'] == postImgId) {
        //     imgUrl = media[i]['imgUrl'] as String;
        //     print('imgUrl loop: $imgUrl');
        //     break;
        //   }
        //   print('imgUrl not loop: $imgUrl');
        // }
        imgUrl ??=
            'https://paulvanderlaken.files.wordpress.com/2020/02/post-box-11.jpg';

        return Post(
          id: post['id'] as int,
          title: post['title']['rendered'] as String,
          link: post['link'] as String,
          body: post['content']['rendered'] as String,
          imgUrl: imgUrl,
          date: DateTime.tryParse(post['date'] as String),
        );
      }).toList();
      notifyListeners();
    } catch (error) {
      print('getPosts catch error: ' + error.toString());
      throw error.toString();
    }
  }

  Future<void> createPost({String title, String body}) async {
    try {
      final String url = '$API_URL/posts';

      Response response;
      var dio = Dio();
      var client = response = await dio.post(
        url,
        data: {
          'date': DateTime.now().toIso8601String(),
          'date_gmt': DateTime.now().toIso8601String(),
          'slug': title.replaceAll(' ', '-'),
          'status': 'publish',
          'title': title,
          'content': body,
          'excerpt': body,
          'comment_status': 'closed',
          'ping_status': 'closed',
          'format': 'standard',
          'meta': [],
          'sticky': false,
          'template': "",
          'tags': [],
          'categories': [],
        },
        options: Options(
          headers: {
            'Authorization': authKeyPostman,
            'Content-Type': 'application/json',
          },
        ),
      );

      final decodedResponseBody = response.data;
      print(decodedResponseBody);
      print(response.statusCode);

      if (response.statusCode >= 400) {
        throw Exception('Status Code >= 400 createPost');
      }

      notifyListeners();
    } catch (error) {
      print('createPost catch error: ' + error.toString());
      throw error.toString();
    }
  }

  Future<void> getTrendings() async {
    try {
      final String url = '$API_URL/posts?categories=27';

      Response response;
      var dio = Dio();

      // await getMedia();
      response = await dio.get(url);

      final List<dynamic> decodedResponseBody = response.data as List<dynamic>;
      print(decodedResponseBody);

      if (response.statusCode >= 400) {
        throw Exception('Status Code >= 400 getTrendings');
      }

      trendings = decodedResponseBody.map((post) {
        String imgUrl;
        imgUrl ??=
            'https://paulvanderlaken.files.wordpress.com/2020/02/post-box-11.jpg';
        return Post(
          id: post['id'] as int,
          title: post['title']['rendered'] as String,
          link: post['link'] as String,
          body: post['content']['rendered'] as String,
          imgUrl: imgUrl,
          date: DateTime.tryParse(post['date'] as String),
        );
      }).toList();
      notifyListeners();
    } catch (error) {
      print('getTrendings catch error: ' + error.toString());
      throw error.toString();
    }
  }

  Future<void> getMedia() async {
    try {
      final String url = '$API_URL/media';

      Response response;
      var dio = Dio();
      response = await dio.get(url);

      final List<dynamic> decodedResponseBody = response.data as List<dynamic>;
      print(decodedResponseBody);
      if (response.statusCode >= 400) {
        throw Exception('Status Code >= 400 getMedia');
      }
      media = decodedResponseBody
          .map((img) => {
                'id': img['id'] as int,
                'imgUrl': img['guid']['rendered'] as String,
              })
          .toList();
      print(media);
      notifyListeners();
    } catch (error) {
      print('getMedia catch error: ' + error.toString());
      throw error.toString();
    }
  }
}
