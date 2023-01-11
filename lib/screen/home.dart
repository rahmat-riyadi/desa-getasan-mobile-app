import 'package:carousel_slider/carousel_slider.dart';
import 'package:desa_getasan_app/components/carouselCard.dart';
import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Pallete.primary
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                color: Pallete.primary,
              ),
              child: LayoutBuilder(
                builder: (p0, p1) => Stack(
                  children: [
                    SafeArea(
                      child: Image.asset(
                        'assets/icons/header-pattern.png', 
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: p1.maxHeight,
                      ),
                    ),
                    SafeArea(
                      child: Align(
                        alignment: Alignment.center,
                        child: CarouselSlider(
                          items: [1,2,3,4,5].map((i) => const CarouselCard()).toList(), 
                          options: CarouselOptions(
                            height: p1.maxHeight * 0.53,
                            // aspectRatio: 2.5,
                            viewportFraction:  0.85
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)
                  )
                ),
              )
            )
          ],
        ),
      )
    );
  }
}