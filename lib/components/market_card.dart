import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MarketCard extends StatelessWidget {

  final int index;
  final String item, price, category, img;

  const MarketCard({
    Key? key, required this.index, required this.item, required this.price, required this.category, required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            ),
            child: Image.network(
              'https://cms.desagetasan.id/$img',
              width: double.maxFinite,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Text('no data'),
              loadingBuilder: (context, child, loadingProgress) => loadingProgress != null ? Shimmer(
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
                  color: Colors.white,
                  height: 120,
                ),
              ) : child,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Color(0x0e153a0d)
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14
                    ),
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    fixedSize: const Size.fromHeight(10)
                  ),
                  onPressed: (){}, 
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Lihat Produk',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Pallete.secondary
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Pallete.secondary,)
                    ],
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}