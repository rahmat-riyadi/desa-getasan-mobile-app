import 'package:desa_getasan_app/models/announcement.dart';
import 'package:dio/dio.dart';

class AnnouncementService {

  final _dio = Dio();

  Future<List<Announcement>> getAnnouncementList() async {


    try {
      
      final response = await Dio().get(
        'https://cms.desagetasan.id/api/blog/latest',
        options: Options(
          headers: {
            'apiKey': 'desagetasan123'
          }
        )
      );

      var result = response.data['data'] as List;

      List<Announcement> announcements = result.map((e) => Announcement.fromJson(e)).toList();

      return announcements;

    } catch (e) {
      
      throw Exception(e.toString());

    }

  }



}

