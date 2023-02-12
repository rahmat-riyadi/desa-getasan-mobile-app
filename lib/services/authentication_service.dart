import 'package:dio/dio.dart';

class AuthenticationService {

  Future<dynamic> login(Map<String, dynamic> data) async {

    try {
      
      final response = await Dio().post(
        'http://localhost:8000/api/login',
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