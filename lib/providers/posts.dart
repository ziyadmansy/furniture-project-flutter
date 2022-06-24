import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:furniture_app/models/post.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/utils/api_routes.dart';
import 'package:furniture_app/utils/constants.dart';

class Posts with ChangeNotifier {
  List<Post> posts = [];
  List<Product> products = [];
  List<Map<String, dynamic>> media = [];

  Future<void> getPosts() async {
    try {
      Response response;
      var dio = Dio();

      response = await dio.get(ApiRoutes.posts);

      final List<dynamic> decodedResponseBody = response.data as List<dynamic>;
      print(decodedResponseBody);

      if (response.statusCode >= 400) {
        throw Exception('Status Code >= 400 getPosts');
      }

      posts = decodedResponseBody
          .map((post) => Post.fromJson(post as Map<String, dynamic>))
          .toList();
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

  Future<void> getProducts() async {
    try {
      Response response;
      var dio = Dio();

      response = await dio.get(ApiRoutes.products);

      final List<dynamic> decodedResponseBody = response.data as List<dynamic>;
      print(decodedResponseBody);

      if (response.statusCode >= 400) {
        throw Exception('Status Code >= 400 getTrendings');
      }

      products = decodedResponseBody
          .map((prod) => Product.fromJson(prod as Map<String, dynamic>))
          .toList();
      notifyListeners();
    } catch (error) {
      print('getTrendings catch error: ' + error.toString());
      throw error.toString();
    }
  }
}
