import 'package:desa_getasan_app/bloc/umkm_bloc.dart';
import 'package:desa_getasan_app/bloc/umkm_category_bloc.dart';
import 'package:desa_getasan_app/components/market_list.dart';
import 'package:desa_getasan_app/components/market_skeleton.dart';
import 'package:desa_getasan_app/screen/market.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

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
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Lihat Berdasarkan',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffEAEAEA)
                          ),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        // width: 110,
                        child: Opacity(
                          opacity: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('loading'),
                              Icon(Icons.keyboard_arrow_down_rounded, size: 30,)
                            ],
                          ),
                        ),
                      ),
                    );
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
                    return MarketList(controller: _scrollController, state: state);
                  }
          
                  return const MarketSkeleton();

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