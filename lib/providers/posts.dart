import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:furniture_app/models/post.dart';
import 'package:furniture_app/utils/constants.dart';

class Posts with ChangeNotifier {
  List<Post> posts = [
    Post(
      id: 1,
      link: 'https://www.google.com/',
      title: 'Living room',
      body: 'cheerfulness combined with sophistication is our approach .',
      imgUrl:
          'https://images.unsplash.com/photo-1618221381711-42ca8ab6e908?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
      date: DateTime.now(),
    ),
   /* Post(
      id: 1,
      link: 'https://www.google.com/',
      title: 'Beds',
      body: 'We made you after the end of each day a good sleep.',
      imgUrl:
          'https://img.edilportale.com/products/REDONDO-Bed-Moroso-448181-rel34ede8b0.jpg?1643719854352',
      date: DateTime.now(),
    ),*/
    
Post(
      id: 3,
      link: 'https://www.google.com/',
      title: 'dining table ',
      body: 'A comfortable and quiet dining room that gives you a feeling of happiness  .',
      imgUrl:
          'https://th.bing.com/th/id/R.ad5309861f55f26abdac87f473a70eda?rik=9eJHUoh9aVgC2w&riu=http%3a%2f%2fcdn.ecommercedns.uk%2ffiles%2f5%2f227805%2f4%2f4497284%2fwalnut-small-dining-table-for-4.jpg&ehk=xGw40PewLV%2fB1XeOLsAAoYvVACSeQgUj%2bgXpB4M3raQ%3d&risl=&pid=ImgRaw&r=0',
      date: DateTime.now(),
    ),
    /*Post(
      id: 4,
      link: 'https://www.google.com/',
      title: 'Kitchens',
      body: 'Sophistication with simplicity to make you feel comfortable in your kitchen.',
      imgUrl:
          'https://img.edilportale.com/products/round-ornare-549281-relecb4c3c5.jpg?1643719929918',
      date: DateTime.now(),
    ),
    Post(
      id: 5,
      link: 'https://www.google.com/',
      title: 'Bedroom for kids',
      body: 'Exploiting spaces with simplicity for your child room',
      imgUrl:
          'https://img.edilportale.com/product-thumbs/b_TIRAMOLLA-916-TUMIDEI-204756-relb51486b.jpg',
      date: DateTime.now(),
    ),*/
    
    Post(
      id: 6,
      link: 'https://www.google.com/',
      title: 'chairs',
      body: 'Comfortable chair, nice time .',
      imgUrl:
          'https://cdn.shopify.com/s/files/1/0399/1126/0318/products/BossatHomeProduct-PalomaLounge6.jpg?v=1594840230',
      date: DateTime.now(),
    ),
  ];
  List<Post> trendings = [
    Post(
      id: 7,
      link: 'https://www.google.com/',
      title: 'Classy living room ',
      body: 'Elegance beats everything ',
      imgUrl:
          'https://images.unsplash.com/photo-1618221469555-7f3ad97540d6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
      date: DateTime.now(),
    ),
    
    
    
    /*Post(
      id: 8,
      link: 'https://www.google.com/',
      title: 'kids room ',
      body: 'We provide a peaceful sleep for your child. ',
      imgUrl:
          'https://img.edilportale.com/product-thumbs/2b_KC306-Bedroom-set-Moretti-Compact-461223-rel96c8eedf.jpg',
      date: DateTime.now(),
    
    Post(
      id: 9,
      link: 'https://www.google.com/',
      title: 'Day Bed ',
      body: 'Sophistication and simplicity is our approach  ',
      imgUrl:
          'https://img.edilportale.com/product-thumbs/2b_day-bed-flexform-554816-reled24d5e.jpg',
      date: DateTime.now(),
    ),
    */

    Post(
      id: 10,
      link: 'https://www.google.com/',
      title: 'living room ',
      body: 'Cute living room always win',
      imgUrl:
          'https://images.unsplash.com/photo-1617103996702-96ff29b1c467?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
      date: DateTime.now(),
    ),

   /* Post(
      id: 17,
      link: 'https://www.google.com/',
      title: 'Bedroom ',
      body: 'The most important thing at the end of the day is a quiet sleep, and this is what our products provide.  ',
      imgUrl:
          'https://img.edilportale.com/product-thumbs/b_Hotel-bedroom-Cosy-International-548718-rel645990b0.jpg',
      date: DateTime.now(),
    ),*/
  Post(
      id: 16,
      link: 'https://www.google.com/',
      title: 'Classy chair ',
      body: 'Elegance beats everything ',
      imgUrl:
          'https://cdn.shopify.com/s/files/1/0399/1126/0318/products/BossatHomeProduct-Mr_Mrs3.jpg?v=1593618756',
      date: DateTime.now(),
    ),
  ];
  List<Map<String, dynamic>> media = [];

  Future<void> getPosts() async {
    try {
      // final String url = '$API_URL/posts';

      // Response response;
      // var dio = Dio();

      // // await getMedia();
      // response = await dio.get(url);

      // final List<dynamic> decodedResponseBody = response.data as List<dynamic>;
      // print(decodedResponseBody);

      // if (response.statusCode >= 400) {
      //   throw Exception('Status Code >= 400 getPosts');
      // }

      // posts = decodedResponseBody.map((post) {
      //   // {
      //   //     'id': img['id'],
      //   //     'imgUrl': img['guid']['rendered'],
      //   //   }
      //   String imgUrl;
      //   // int postImgId = post['featured_media'] as int;
      //   // for (int i = 0; i < media.length; i++) {
      //   //   if (media[i]['id'] == postImgId) {
      //   //     imgUrl = media[i]['imgUrl'] as String;
      //   //     print('imgUrl loop: $imgUrl');
      //   //     break;
      //   //   }
      //   //   print('imgUrl not loop: $imgUrl');
      //   // }
      //   imgUrl ??=
      //       'https://paulvanderlaken.files.wordpress.com/2020/02/post-box-11.jpg';

      //   return Post(
      //     id: post['id'] as int,
      //     title: post['title']['rendered'] as String,
      //     link: post['link'] as String,
      //     body: post['content']['rendered'] as String,
      //     imgUrl: imgUrl,
      //     date: DateTime.tryParse(post['date'] as String),
      //   );
      // }).toList();
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
