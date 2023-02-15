import 'package:desa_getasan_app/bloc/umkm_bloc.dart';
import 'package:desa_getasan_app/bloc/umkm_category_bloc.dart';
import 'package:desa_getasan_app/models/item_business_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketHeader extends StatelessWidget {
  const MarketHeader(
      {Key? key, required this.itemCategories, required this.selectedCategory})
      : super(key: key);

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
              child: BlocBuilder<UmkmCategoryBloc, UmkmCategoryState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      context.read<UmkmCategoryBloc>().add(ChangeUmkmCategory(itemCategories, e.id));
                      context.read<UmkmBloc>().add(LoadUmkmEvent(id: e.id, changeCategory: true));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 14),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xfff2f2f2),
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: selectedCategory.itemCategory ==
                                  e.itemCategory
                              ? const Color(0xfff4f6f8)
                              : Colors.white
                            ),
                      child: Text(
                        e.itemCategory,
                        style: TextStyle(
                            fontWeight: selectedCategory.itemCategory ==
                                    e.itemCategory
                                ? FontWeight.bold
                                : FontWeight.normal
                                ),
                      ),
                    ),
                  );
                },
              )
            ),
          ).toList()
        ),
      ),
    );
  }
}
