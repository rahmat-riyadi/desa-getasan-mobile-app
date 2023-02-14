import 'package:dio/dio.dart';

class UserService {

  Future<dynamic> changePassword(Map<String, dynamic> data, String id) async {

    try {
      
      final response = await Dio().post(
        'http://localhost:8000/api/changePassword/$id',
        options: Options(
          headers: {
            'apiKey': 'desagetasan123'
          }
        ),
        data: data
      );

      return response.data;

    } on DioError catch (e) {
      
      return e.response?.data;

    }

  }

}