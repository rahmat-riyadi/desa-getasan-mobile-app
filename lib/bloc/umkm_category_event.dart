part of 'umkm_category_bloc.dart';

abstract class UmkmCategoryEvent extends Equatable {
  const UmkmCategoryEvent();

  @override
  List<Object> props() => [];
}

class LoadUmkmCategory extends UmkmCategoryEvent {}

class ChangeUmkmCategory extends UmkmCategoryEvent{

  final List<ItemBusinessCategory> umkmCategories;
  final int selectedCategory;

  const ChangeUmkmCategory(this.umkmCategories, this.selectedCategory);

  @override
  List<Object> props() => [umkmCategories, selectedCategory];

}