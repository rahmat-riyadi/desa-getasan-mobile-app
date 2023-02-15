import 'package:desa_getasan_app/components/market_card.dart';
import 'package:desa_getasan_app/utils/parser.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MarketList extends StatelessWidget {
 
  const MarketList({
    super.key, 
    required this.controller, 
    this.state
  });

  final ScrollController controller;
  final dynamic state;

  final LinearGradient gradient = const LinearGradient(
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
  );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.85,
      ), 
      itemBuilder: (context, index) {

        if(index >= state.userBusinessItem.length){
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer(
                  gradient: gradient,
                  child: Container(
                    height: 120,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer(
                        gradient: gradient,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 10,
                          width: 40,
                          color: Colors.white,
                        ),
                      ),
                      Shimmer(
                        gradient: gradient,
                        child: Container(
                          height: 10,
                          width: 80,
                          color: Colors.white,
                        ),
                      ),
                      Shimmer(
                        gradient: gradient,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          height: 10,
                          width: 80,
                          color: Colors.white,
                        ),
                      ),
                      Shimmer(
                        gradient: gradient,
                        child: Container(
                          height: 10,
                          width: 80,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/detailMarket',arguments: state.umkmData.result[index]),
          child: MarketCard(
            category: state.userBusinessItem[index]
                .itemBusinessCategory.itemCategory,
            index: index,
            img: state.userBusinessItem[index].itemImage,
            item: state.userBusinessItem[index].itemName,
            price: Parser().rupiahFormatter(state.userBusinessItem[index].itemPrice),
          ),
        );
      },
      itemCount: state.hasReachedMax ? state.userBusinessItem.length : state.userBusinessItem.length + 2,
    );
  }
}