import 'dart:developer';

import 'package:desa_getasan_app/bloc/umkm_bloc.dart';
import 'package:desa_getasan_app/bloc/umkm_category_bloc.dart';
import 'package:desa_getasan_app/components/add_product_FAB.dart';
import 'package:desa_getasan_app/components/market_card.dart';
import 'package:desa_getasan_app/models/item_business_category.dart';
import 'package:desa_getasan_app/services/umkm_service.dart';
import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:desa_getasan_app/utils/parser.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as dynamic;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UmkmBloc(RepositoryProvider.of<UmkmService>(context))..add(const LoadUmkmEvent())),
        BlocProvider(create: (context) => UmkmCategoryBloc(RepositoryProvider.of<UmkmService>(context))..add(LoadUmkmCategory()))
      ],
      child: Scaffold(
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
                          topRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(color: Colors.white, offset: Offset(1, 1))
                      ]),
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
                    )),
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
                            padding: const EdgeInsets.only(top: 5, bottom: 8),
                            child: Text(
                              (args['userProduct']) ? 'Produk Saya' : 'Pasar',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                          const Text(
                            'Lorem ipsum dolor sit amet consectetur.',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<UmkmCategoryBloc, UmkmCategoryState>(
              builder: (context, state) {

                if(state is UmkmCategoryLoaded){
                  return MarketHeader(
                    args: args, 
                    itemCategories: state.umkmCategories,
                    selectedCategory: state.selectedCategory,
                  );
                }

                if(state is UmkmCategoryChanged){
                  return MarketHeader(
                    args: args, 
                    itemCategories: state.umkmCategories,
                    selectedCategory: state.selectedCategory,
                  );
                }

                if(state is UmkmCategoryFailed){
                  return const SliverToBoxAdapter(
                    child: Text('failed')
                  );
                }

                return const SliverToBoxAdapter(
                  child: Text('loading'),
                );

              },
            ),
            BlocBuilder<UmkmBloc, UmkmState>(
              builder: (context, state) {
                if (state is UmkmFailed) {
                  return SliverToBoxAdapter(
                    child: Center(
                        child: ElevatedButton(
                      onPressed: () =>
                          context.read<UmkmBloc>().add(const LoadUmkmEvent()),
                      child: const Text('data'),
                    )),
                  );
                }

                if (state is UmkmLoaded) {
                  return SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, '/detailMarket',
                                    arguments: state.umkmData.result[index]),
                                child: MarketCard(
                                  category: state.umkmData.result[index]
                                      .itemBusinessCategory.itemCategory,
                                  index: index,
                                  img: state.umkmData.result[index].itemImage,
                                  item: state.umkmData.result[index].itemName,
                                  price: Parser().rupiahFormatter(
                                      state.umkmData.result[index].itemPrice),
                                ),
                              ),
                          childCount: state.umkmData.result.length),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.77,
                      ));
                }

                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MarketHeader extends StatelessWidget {

  const MarketHeader({ 
    Key? key, this.args, 
    required this.itemCategories, 
    required this.selectedCategory
  }) : super(key: key);

  final args;
  final ItemBusinessCategory selectedCategory;
  final List<ItemBusinessCategory> itemCategories;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: (!args['userProduct'])
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lihat Berdasarkan',
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  DropdownButton2(
                    items: itemCategories.map(
                      (e) => DropdownMenuItem(
                        value: e.id,
                        child: Text(e.itemCategory),
                      )
                    ).toList(), 
                    underline: Container(),
                    value: selectedCategory.id,
                    onChanged: (newVal){
                      log(newVal.toString());
                      context.read<UmkmCategoryBloc>().add(ChangeUmkmCategory(itemCategories, newVal!));
                      
                    },
                    customButton: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffEAEAEA)
                        ),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      // width: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(selectedCategory.itemCategory),
                          const Icon(Icons.keyboard_arrow_down_rounded, size: 30,)
                        ],
                      ),
                    ),
                    dropdownWidth: 150,
                    dropdownDirection: DropdownDirection.left,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  )
                ],
              )
            : null,
      ),
    );
  }
}
