import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmergencyContactCard extends StatelessWidget {

  final String contact;

  const EmergencyContactCard({
    Key? key, required this.contact
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose ,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffF1F3F6),
            width: 1
          ),
          borderRadius: BorderRadius.circular(7)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(contact),
            SvgPicture.asset('assets/icons/call.svg')
          ],
        ),
      ),
    );
  }
}