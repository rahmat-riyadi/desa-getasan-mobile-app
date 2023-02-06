import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/placeholder.png'),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(17),
        color: const Color.fromARGB(61, 255, 193, 7),
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromRGBO(0, 170, 225, 0.10000000149011612), Color.fromRGBO(14, 21, 58, 0.800000011920929) ],
                begin: Alignment(0,-0.2),
                end: Alignment(0, 1),
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      CarouselSmallTitle(person: 'By Rahmat Riyadi Syam', icon: 'profile-circle.svg'),
                      const SizedBox(width: 10),
                      CarouselSmallTitle(person: '6 Desember 2022', icon: 'calendar-circle.svg'),
                    ],
                  ),
                ),
                Text(
                  '${'Lorem ipsum dolor sit amet consectetur. Dignissim ac quis justo quisque loreore sfsdfsd sdsdf'.substring(0, 65)}...',
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.white,
                    height: 1.4
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CarouselSmallTitle extends StatelessWidget {

  String person, icon;

  CarouselSmallTitle({super.key, required this.person, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/$icon',
          width: 10,
        ),
        const SizedBox(width: 5),
        Text(
          person,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 8
          ),
        )
      ],
    );
  }
}