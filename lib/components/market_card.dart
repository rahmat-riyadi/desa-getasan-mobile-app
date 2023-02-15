import 'dart:developer';

import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';

class MarketCard extends StatelessWidget {

  final int index;
  final String item, price, category, img;

  const MarketCard({
    Key? key, required this.index, required this.item, required this.price, required this.category, required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Hero(
          tag: 'umkm$img',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://cms.desagetasan.id/$img',
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported_rounded),
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          )
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom: 25
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: const Alignment(0,0.6),
              end: const Alignment(0,0),
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.3),
              ]
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Pallete.primary.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Text(
                item,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14
                ),
              ),
              const SizedBox(height: 5),
              Text(
                price,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
                ),
              )
            ],
          ),
        )
      ],
    );  
  }
}