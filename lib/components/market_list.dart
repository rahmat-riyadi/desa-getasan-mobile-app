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
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.85,
      ), 
      itemBuilder: (context, index) {

        if(index >= state.userBusinessItem.length){
          return Stack(
            children: [
              Shimmer(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 204, 204, 204),
                    Color.fromARGB(255, 199, 199, 199),
                    Color.fromARGB(255, 219, 219, 219),
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
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 212, 212, 212),
                        borderRadius: BorderRadius.circular(10)
                      ),
                )
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                  bottom: 25
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Shimmer(
                          gradient: gradient,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                            color: Colors.white,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            height: 17,
                            width: 50,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Shimmer(
                        gradient: gradient,
                        child: Container(
                          width: 40,
                          height: 10,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Shimmer(
                        gradient: gradient,
                        child: Container(
                          width: 75,
                          height: 15,
                          color: Colors.red,
                        ),
                      ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        }

        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/detailMarket',arguments: state.userBusinessItem[index]),
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
      itemCount: 
        state.hasReachedMax 
        ? 
        state.userBusinessItem.length 
        : 
          !state.userBusinessItem.isEmpty 
          ?
          state.userBusinessItem.length + 2
          :
          0
    );
  }
}