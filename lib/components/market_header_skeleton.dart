import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MarketHeaderSkeleton extends StatelessWidget {

  const MarketHeaderSkeleton({ Key? key }) : super(key: key);

  final LinearGradient gradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 173, 173, 176),
      Color.fromARGB(255, 189, 189, 189),
      Color.fromARGB(255, 178, 178, 181),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [1,2,3,4,5,7,8,9,10].map((e) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Shimmer(
              gradient: gradient,
              child: Container(
                width: Random().nextInt(30) + 40,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green 
                  ),
                  borderRadius: BorderRadius.circular(8)
                ),
              ),
            )
          ),
          ).toList()
        ),
      ),
    );
  }
}
