import 'package:dio/dio.dart';

class UmkmService {

  Future<dynamic> getUmkm({int page = 1}) async {

    try {
      
      final response = await Dio().get(
        'https://cms.desagetasan.id/api/umkm?page=$page',
        options: Options(
          headers: {
            'apiKey': 'desagetasan123'
          }
        )
      );

      return response.data;

    } on DioError catch (e) {
      
      return e.response?.statusCode.toString() ;

    }

  }

  Future<dynamic> getUmkmByCategory(int category, {int page = 1}) async {

    try {
      
      final response = await Dio().get(
        'https://cms.desagetasan.id/api/umkm?page=$page&category_id=$category',
        options: Options(
          headers: {
            'apiKey': 'desagetasan123'
          }
        )
      );

      return response.data;

    } on DioError catch (e) {
      
      return e.response?.statusCode.toString() ;

    }

  }

  Future<dynamic> getUmkmCategory() async {

    try {
      
      final response = await Dio().get(
        'https://cms.desagetasan.id/api/umkmCategory',
        options: Options(
          headers: {
            'apiKey': 'desagetasan123'
          }
        )
      );

      return response.data;

    } on DioError catch (e) {
      
      return e.response?.statusCode.toString() ;

    }

  }

}