import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:furniture_app/utils/constants.dart';

class Auth with ChangeNotifier {
  int id;
  String profileName = 'Ziyad Mansy';
  String websiteLink = 'https://www.google.com/';
  String profileImg = 'https://scontent.fcai20-2.fna.fbcdn.net/v/t1.6435-9/142655105_3708214665924749_7179964958772877739_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=oCMBOXjJse8AX-Pd9sy&_nc_ht=scontent.fcai20-2.fna&oh=00_AT-M_eK9mjhiZLLg0CFeLADXsFS5Om61BCVMHR2bLXVFmg&oe=6217B3AB';

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
      websiteLink = decodedResponseBody['link'] as String;
      profileImg = decodedResponseBody['avatar_urls']['96'] as String;

      notifyListeners();
    } catch (error) {
      print('getProfile catch error: ' + error.toString());
      throw error.toString();
    }
  }
}
