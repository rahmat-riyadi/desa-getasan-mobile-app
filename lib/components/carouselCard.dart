import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromRGBO(0, 170, 225, 0.10000000149011612), Color.fromRGBO(14, 21, 58, 0.800000011920929) ],
                begin: Alignment(0,-0.2),
                end: Alignment(0, 1),
              )
            ),
          )
        ],
      ),
    );
  }
}