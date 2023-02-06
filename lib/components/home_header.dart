import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Pallete.primary,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      maxLines: 1,
                      text: const TextSpan(
                          text: 'Hallo, ',
                          style: TextStyle(fontSize: 15),
                          children: [
                            TextSpan(
                              text: 'Putu Gede!',
                              style:
                                  TextStyle(fontWeight: FontWeight.w700),
                            )
                          ])),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset('assets/icons/notification.svg'),
                      Positioned(
                          left: 10,
                          bottom: 15,
                          child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                  color: Color(0xffFFAB00),
                                  shape: BoxShape.circle),
                              child: const Text(
                                '3',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )))
                    ],
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 5),
                padding: const EdgeInsets.all(30),
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/header-card-bg.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Selamat Datang',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ),
                    Text(
                      'di Sistem Pelayanan\nDesa Getasan',
                      style: TextStyle(
                          fontSize: 14,
                          // fontWeight: FontWeight.w900,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}