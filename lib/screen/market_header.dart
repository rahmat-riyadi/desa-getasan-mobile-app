import 'package:desa_getasan_app/models/item_business_category.dart';
import 'package:flutter/material.dart';

class MarketHeader extends StatelessWidget {

  const MarketHeader({ 
    Key? key,
    required this.itemCategories, 
    required this.selectedCategory
  }) : super(key: key);

  final ItemBusinessCategory selectedCategory;
  final List<ItemBusinessCategory> itemCategories;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: itemCategories.map((e) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 14
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xfff2f2f2)
                ),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Text(
                e.itemCategory
              ),
            )
          ),
          ).toList()
        ),
      ),
    );
  }
}
