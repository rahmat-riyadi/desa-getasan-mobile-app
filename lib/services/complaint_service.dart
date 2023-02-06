import 'package:dio/dio.dart';

class ComplaintService {

  Future<dynamic> storeComplaint(Map<String, dynamic> data) async {

    try {

      final response = await Dio().post(
        'https://cms.desagetasan.id/api/complaint',
        options: Options(
          headers: {
            'apiKey': 'desagetasan123'
          }
        )
      );

      return response.data;

    } on DioError catch (e) {

      return e.response!.data;

    }

  }

}