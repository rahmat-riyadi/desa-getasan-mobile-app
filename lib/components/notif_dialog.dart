import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotifDialog extends StatelessWidget {

  const NotifDialog({
    super.key, 
    required this.title, 
    required this.subtitle, 
    required this.image
  });

  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/$image'),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff181C32)
                ),
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff181C32)
              ),
            ),
          ],
        ),
      ),
    );
  }
}