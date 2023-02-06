import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:desa_getasan_app/models/item_business_category.dart';
import 'package:desa_getasan_app/services/umkm_service.dart';
import 'package:equatable/equatable.dart';

part 'umkm_category_event.dart';
part 'umkm_category_state.dart';

class UmkmCategoryBloc extends Bloc<UmkmCategoryEvent, UmkmCategoryState> {

  final UmkmService _umkmService;

  UmkmCategoryBloc(this._umkmService) : super(UmkmCategoryInitial()) {

    on<LoadUmkmCategory>((event, emit) async  {
      
      final result = await _umkmService.getUmkmCategory();

      log(result.toString());

      if(result['status'] == 'success'){
        List<ItemBusinessCategory> itemBusinessCategories = List<ItemBusinessCategory>.from(
          result['data'].map((e) => ItemBusinessCategory.fromJson(e))
        );

        itemBusinessCategories = [
          ItemBusinessCategory(
            id: 0, 
            itemCategory: 'Semua', 
            createdAt: DateTime.now(), 
            updatedAt: DateTime.now()
          ),
          ...itemBusinessCategories
        ];
        emit(UmkmCategoryLoaded(itemBusinessCategories, itemBusinessCategories[0]));
      } else {
        emit(UmkmCategoryFailed());
      }

    });

    on<ChangeUmkmCategory>((event, emit) {

      ItemBusinessCategory selectedCategory = event.umkmCategories.singleWhere(
        (element) => element.id == event.selectedCategory
      );

      log(event.selectedCategory.toString());

      emit(UmkmCategoryChanged(event.umkmCategories, selectedCategory));

    });

  }
}
