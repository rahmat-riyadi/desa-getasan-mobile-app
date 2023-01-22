import 'package:flutter/material.dart';

class AnnouncementList extends StatelessWidget {

  final String title, date, desc, img;

  const AnnouncementList({
    Key? key, required this.title, required this.date, required this.desc, required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.network(
                  'https://cms.desagetasan.id/$img',
                  width: 100,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        date,
                        style: const TextStyle(
                          color: Color(0xff7B7B7B),
                          fontSize: 11
                        ),
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xFF121212)
                        ),
                      ),
                      Text(
                        desc.substring(0, 60) + '...',
                        maxLines: 2,
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xff7B7B7B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded, size: 21,)
            ],
          ),
        ),
        Container(
          height: 1,
          margin: EdgeInsets.symmetric(vertical: 15),
          decoration: const BoxDecoration(
            color: Color(0xffeaeaea)
          ),
        )
      ],
    );
  }
}