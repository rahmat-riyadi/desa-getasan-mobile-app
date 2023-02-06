import 'package:desa_getasan_app/models/announcement.dart';
import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:desa_getasan_app/utils/parser.dart';
import 'package:flutter/material.dart';

class DetailAnnoncement extends StatelessWidget {
  const DetailAnnoncement({super.key});

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Announcement;

    return Scaffold(
      backgroundColor: Pallete.primary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black,),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Detail Berita & Pengumuman',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://cms.desagetasan.id/${args.image}',
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                args.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    args.updatedBy,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  Text(
                    '${args.date}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff7B7B7B)
                    ),
                  ),
                ],
              ),
            ),
            Text(
              Parser().textParser(args.description),
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xff7B7B7B),
                height: 1.7
              ),
            ),
          ],
        ),
      ),
    );
  }
}