import 'package:desa_getasan_app/bloc/umkm_bloc.dart';
import 'package:desa_getasan_app/bloc/umkm_category_bloc.dart';
import 'package:desa_getasan_app/components/add_product_fab.dart';
import 'package:desa_getasan_app/components/market_body.dart';
import 'package:desa_getasan_app/services/umkm_service.dart';
import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketPage extends StatelessWidget {

  const MarketPage({super.key, required this.userProduct});

  final bool userProduct;

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UmkmBloc(RepositoryProvider.of<UmkmService>(context))..add(const LoadUmkmEvent())),
        BlocProvider(create: (context) => UmkmCategoryBloc(RepositoryProvider.of<UmkmService>(context))..add(LoadUmkmCategory()))
      ],
      child: Scaffold(
        backgroundColor: Pallete.primary,
        floatingActionButton: (userProduct) ? const AddProductFAB() : null,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Pallete.primary,
            elevation: 0,
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
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 15,
                            color: Pallete.primary,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            (userProduct) ? 'Produk Saya' : 'Pasar',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 31,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: const MarketBody(),
      ),
    );
  }
}
