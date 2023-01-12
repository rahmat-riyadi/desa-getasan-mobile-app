import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreCard extends StatelessWidget {

  final String icon, title;

  const ExploreCard({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/$icon'),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}