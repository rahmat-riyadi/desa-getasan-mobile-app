import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';

class MarketCard extends StatelessWidget {

  final int index;
  final String item, price, category;

  const MarketCard({
    Key? key, required this.index, required this.item, required this.price, required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: (index % 2 == 1) ? 16 : 0,
        left: (index % 2 == 0) ? 16 : 0
      ),
      child: Container(
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
                'https://api.lorem.space/image/house?w=250&h=250',
                width: double.maxFinite,
                height: 120,
                fit: BoxFit.cover,
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
                      color: Color(0xff0e153a0d)
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    child: Text(
                      '$item $index',
                      style: const TextStyle(
                        fontSize: 14
                      ),
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(
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
      ),
    );
  }
}