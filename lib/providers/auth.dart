import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:furniture_app/enums/gender.dart';
import 'package:furniture_app/utils/constants.dart';
import 'package:toast/toast.dart';

import '../utils/api_routes.dart';

class Auth with ChangeNotifier {
  int id;
  String profileName = '';
  String profileCity = '';

  Future<void> register({
    @required String firstName,
    @required String lastName,
    @required Gender gender,
    @required String age,
    @required String email,
    @required String password,
    @required bool isCustomer,
  }) async {
    try {
      // Customer value=0
      // Designer value=2

      final model = {
        'firstname': firstName,
        'lastname': lastName,
        'birthday': '26/9/1999',
        'city': 'cairo',
        'region': 'cairo',
        'street': 'cairo',
        'phone': '1119586564',
        'role_as': isCustomer ? 0 : 2,
        'gender': gender.name,
        'age': age,
        'email': email,
        'password': password,
        'password_confirmation': password,
      };

      print(model);

      Response response;
      var dio = Dio();
      response = await dio.post(
        ApiRoutes.register,
        data: model,
      );

      final decodedResponseBody = response.data;
      print(decodedResponseBody);

      if (response.statusCode >= 400) {
        throw Exception('Status Code >= 400 register');
      }

      notifyListeners();
    } on DioError catch (e) {
      print(e.response.statusCode);
      print(e.response.data);
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.post(
        ApiRoutes.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      final decodedResponseBody = response.data;
      print(decodedResponseBody);

      if (response.statusCode >= 400) {
        throw Exception('Status Code >= 400 register');
      }

      id = decodedResponseBody['user']['id'] as int;
      profileName = decodedResponseBody['user']['firstname'].toString() + decodedResponseBody['user']['lastname'].toString();
      profileCity = decodedResponseBody['user']['city'].toString();

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getProfile(int id) async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get(ApiRoutes.portfolio(id));

      final Map<String, dynamic> decodedResponseBody =
          response.data as Map<String, dynamic>;
      print(decodedResponseBody);
      if (response.statusCode >= 400) {
        throw Exception('Status Code >= 400 getProfile');
      }
      // profileName = decodedResponseBody['name'] as String;
      // websiteLink = decodedResponseBody['link'] as String;
      // profileImg = decodedResponseBody['avatar_urls']['96'] as String;

      notifyListeners();
    } catch (error) {
      print('getProfile catch error: ' + error.toString());
      throw error.toString();
    }
  }
}
