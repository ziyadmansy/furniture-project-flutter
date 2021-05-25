import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:furniture_app/utils/constants.dart';

class Auth with ChangeNotifier {
  int id;
  String profileName;
  String profileLink;
  String profileImg;

  Future<void> getProfile(int id) async {
    try {
      final String url = '$API_URL/users/$id';

      Response response;
      var dio = Dio();
      response = await dio.get(url);

      final Map<String, dynamic> decodedResponseBody =
          response.data as Map<String, dynamic>;
      print(decodedResponseBody);
      if (response.statusCode >= 400) {
        throw Exception('Status Code >= 400 getProfile');
      }
      profileName = decodedResponseBody['name'] as String;
      profileLink = decodedResponseBody['link'] as String;
      profileImg = decodedResponseBody['avatar_urls']['96'] as String;

      notifyListeners();
    } catch (error) {
      print('getProfile catch error: ' + error.toString());
      throw error.toString();
    }
  }
}
