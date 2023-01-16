import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailMarketPage extends StatelessWidget {
  const DetailMarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
        child: SafeArea(
          child: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 5,
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://api.lorem.space/image/house?w=250&h=250'),
                    fit: BoxFit.cover
                  )
                ),
              ),
              title: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                padding: const EdgeInsets.only(top: 16, left: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        elevation: 0,
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                        minimumSize: const Size(0, 0),
                      ), 
                      child: const Icon(Icons.arrow_back_ios_new_rounded, size: 15, color: Colors.black,),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Color(0xff0e153a0d)
              ),
              child: const Text(
                'Barang',
                style: const TextStyle(fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Tas Selempang',
                style: TextStyle(
                  fontSize: 16
                ),
              ),
            ),
            Text(
              'Rp. 80.000,-',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 8),
              child: const Text(
                'Deskripsi',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            Text(
              'Lorem ipsum dolor sit amet consectetur. Vulputate egestas ultrices massa pretium eget. Condimentum nibh dignissim ullamcorper vitae mollis tempor nunc. Rhoncus urna velit nunc integer nunc quisque.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff7B7B7B),
                height: 1.5
              ),
            ),
            Spacer(),
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
                        backgroundColor: Color(0xff1BD741),
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