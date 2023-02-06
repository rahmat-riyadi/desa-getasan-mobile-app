import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AgendaSekeleton extends StatefulWidget {
  const AgendaSekeleton({super.key});

  @override
  State<AgendaSekeleton> createState() => _AgendaSekeletonState();
}

class _AgendaSekeletonState extends State<AgendaSekeleton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0,0.7),
            blurRadius: 2
          )
        ],
        // color: Colors.red
      ),
      width: double.maxFinite,
      child: Column(
        children:  [
          const ShimmerItem(height: 60),
          const ShimmerItem(height: 10),
          const ShimmerItem(height: 10),
          const ShimmerItem(height: 10),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: const [
                Flexible(
                  fit: FlexFit.loose,
                  child: ShimmerItem(height: 30)
                ),
                SizedBox(width: 10),
                Flexible(
                  fit: FlexFit.loose,
                  child: ShimmerItem(height: 30)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShimmerItem extends StatelessWidget {

  final double height;

  const ShimmerItem({
    Key? key, required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: const LinearGradient(
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
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: height,
        width: double.maxFinite,
        color: Colors.white,
      ),
    );
  }
}