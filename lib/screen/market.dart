// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Pallete.primary,
            expandedHeight: MediaQuery.of(context).size.height * 0.16,
            flexibleSpace: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/market-header.png'),
                    fit: BoxFit.cover,
                  )
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          elevation: 0,
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(10),
                          minimumSize: const Size(0, 0),
                        ), 
                        child: const Icon(Icons.arrow_back_ios_new_rounded, size: 15, color: Pallete.primary,),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 8),
                        child: Text(
                          'Pasar',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.white
                          ),
                        ),
                      ),
                      const Text(
                        'Lorem ipsum dolor sit amet consectetur.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                // color: Colors.amber,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                margin: EdgeInsets.only( 
                  right: (index % 2 == 1 ) ? 10 : 0, 
                  left: (index % 2 == 0 ) ? 10 : 0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.10),
                      offset: Offset(0, 1),
                      blurRadius: 12
                    )
                  ]
                ),
                child: Column(
                  children: [
                    LayoutBuilder(
                      builder: (p0, p1) => Image.network(
                        'https://api.lorem.space/image/house?w=250&h=250',
                        width: p1.maxWidth,
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
                            child: const Text(
                              'Barang',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          const Text(
                            'Lorem Ipsum',
                            style: TextStyle(
                              fontSize: 14
                            ),
                          ),
                          // const Text(
                          //   'Rp. 80.000,-',
                          //   style: TextStyle(
                          //     fontSize: 14
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              childCount: 20
            ), 
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 29,
            )
          )
          
        ],
      ),
    );
  }
}