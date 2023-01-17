import 'package:desa_getasan_app/components/addProductFAB.dart';
import 'package:desa_getasan_app/components/marketCard.dart';
import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as dynamic;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: (args['userProduct']) ? const AddProductFAB() : null,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                margin: EdgeInsets.zero,
                width: double.maxFinite,
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(1, 1)
                    )
                  ]
                ),
              ),
            ),
            backgroundColor: Pallete.primary,
            elevation: 0,
            expandedHeight: MediaQuery.of(context).size.height * 0.16,
            flexibleSpace: FlexibleSpaceBar(
              background: LayoutBuilder(
                builder: (p0, p1) => Container(
                  height: p1.maxHeight,
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
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(10),
                            minimumSize: const Size(0, 0),
                          ), 
                          child: const Icon(Icons.arrow_back_ios_new_rounded, size: 15, color: Pallete.primary,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 8),
                          child: Text(
                            (args['userProduct']) ? 'Produk Saya' : 'Pasar',
                            style: const TextStyle(
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
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10 ),
              child: (!args['userProduct']) ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lihat Berdasarkan',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        child: Text('barang'),
                        value: 'barang',
                      ),
                      DropdownMenuItem(
                        child: Text('barang'),
                        value: 'Pakaian',
                      ),
                    ], 
                    onChanged: (newVal) => print(newVal)
                  )
                ],
              ) : null,
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/detailMarket'),
                child: MarketCard(
                  category: 'barang',
                  index: index,
                  item: 'Item',
                  price: 'Rp. 100.000,00',
                ),
              ),
              childCount: 20
            ), 
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.77,
            )
          ),
          
        ],
      ),
    );
  }
}



