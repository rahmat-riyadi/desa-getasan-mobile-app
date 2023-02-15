import 'package:desa_getasan_app/models/user_business_item.dart';
import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:desa_getasan_app/utils/parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailMarketPage extends StatelessWidget {
  const DetailMarketPage({super.key, required this.umkm});

  final UserBusinessItem umkm;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,  
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Pallete.text),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Detail Produk',
          style: TextStyle(
            color: Pallete.text
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
          top: 10
        ),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Hero(
                tag: 'umkm${umkm.itemImage}',
                child: Image.network(
                  'https://cms.desagetasan.id/${umkm.itemImage}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                color: Pallete.primary.withOpacity(0.8),
                borderRadius: BorderRadius.circular(4)
              ),
              child: Text(
                umkm.itemBusinessCategory.itemCategory,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  umkm.itemName,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Pallete.text
                  ),
                ),
                Text(
                  Parser().rupiahFormatter(umkm.itemPrice),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24, bottom: 8),
              child: Text(
                'Deskripsi',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            Text(
              Parser().textParser(umkm.itemDescription),
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xff7B7B7B),
                height: 1.5
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Pallete.secondary,
                        fixedSize: const Size.fromHeight(48),
                        elevation: 0
                      ),
                      onPressed: (){}, 
                      child: const Text(
                        'Buka Dimarket Place',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff1BD741),
                        elevation: 0,
                        fixedSize: const Size(70,48),
                      ),
                      onPressed: (){}, 
                      child: const Icon(Icons.whatsapp, size: 30)
                    ),
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