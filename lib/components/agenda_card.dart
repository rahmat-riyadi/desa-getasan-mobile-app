import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AgendaCard extends StatelessWidget {

  final String title;
  final String description;
  final String author;
  final String month;
  final String day;
  final String dateNum;


  const AgendaCard({
    Key? key, required this.title, required this.description, required this.author, required this.month, required this.day, required this.dateNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (p0, p1) => Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 20),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0,0.7),
              blurRadius: 2
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: p1.maxWidth * 0.15
              ),
              child: Column(
                children: [
                  Text(
                    dateNum,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      color: Pallete.primary
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      month,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      day,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                height: 90,
                margin: const EdgeInsets.only(left: 20),
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Pallete.secondary,
                      width: 2
                    )
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SvgPicture.asset('assets/icons/profile.svg'),
                        ),
                        const SizedBox(width: 15),
                        Text(author)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}