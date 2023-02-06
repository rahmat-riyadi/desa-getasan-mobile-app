import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MarketSkeleton extends StatelessWidget {

  const MarketSkeleton({super.key});

  final LinearGradient gradient = const LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.7,
      ), 
      itemCount: 20,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow : const [
            BoxShadow(
              color: Color.fromRGBO(123, 123, 123, 0.10000000149011612),
              offset: Offset(1,1),
              blurRadius: 12
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer(
              gradient: gradient,
              child: Container(
                height: 120,
                color: Colors.white,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer(
                    gradient: gradient,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 10,
                      width: 40,
                      color: Colors.white,
                    ),
                  ),
                  Shimmer(
                    gradient: gradient,
                    child: Container(
                      height: 10,
                      width: 80,
                      color: Colors.white,
                    ),
                  ),
                  Shimmer(
                    gradient: gradient,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      height: 10,
                      width: 80,
                      color: Colors.white,
                    ),
                  ),
                  Shimmer(
                    gradient: gradient,
                    child: Container(
                      height: 10,
                      width: 80,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}