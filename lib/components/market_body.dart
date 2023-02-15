import 'package:desa_getasan_app/bloc/umkm_bloc.dart';
import 'package:desa_getasan_app/bloc/umkm_category_bloc.dart';
import 'package:desa_getasan_app/components/market_header_skeleton.dart';
import 'package:desa_getasan_app/components/market_list.dart';
import 'package:desa_getasan_app/components/market_skeleton.dart';
import 'package:desa_getasan_app/screen/market_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketBody extends StatefulWidget {

  const MarketBody({super.key});

  @override
  State<MarketBody> createState() => _MarketBodyState();
}

class _MarketBodyState extends State<MarketBody> {

  final ScrollController _scrollController = ScrollController();
  late UmkmBloc _umkmBloc;

  @override
  void initState() {
    super.initState();
    _umkmBloc = context.read<UmkmBloc>();
    _scrollController.addListener(_onscroll);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      // padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Produk',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                BlocBuilder<UmkmCategoryBloc, UmkmCategoryState>(
                  builder: (context, state) {

                    if(state is UmkmCategoryLoaded){
                      return MarketHeader(
                        itemCategories: state.umkmCategories,
                        selectedCategory: state.selectedCategory,
                      );
                    }

                    if(state is UmkmCategoryChanged){
                      return MarketHeader(
                        itemCategories: state.umkmCategories,
                        selectedCategory: state.selectedCategory,
                      );
                    }

                    if(state is UmkmCategoryFailed){
                      return const Text('failed');
                    }

                    return const MarketHeaderSkeleton();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: BlocBuilder<UmkmBloc, UmkmState>(
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
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                        left: 20,
                        right: 20
                      ),
                      child: MarketList(controller: _scrollController, state: state),
                    );
                    // return Text('data');
                  }
          
                  return const Padding(
                      padding: EdgeInsets.only(
                        bottom: 20,
                        left: 20,
                        right: 20
                      ),
                      child: MarketSkeleton(),
                    );

                },
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _onscroll(){
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    if(maxScroll == currentScroll) _umkmBloc.add(const LoadUmkmEvent());
  }
}