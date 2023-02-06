import 'package:dio/dio.dart';

class AgendaService {

  Future<dynamic> getLatestAgenda() async {

    try {

      final response = await Dio().get(
        'https://cms.desagetasan.id/api/agenda',
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