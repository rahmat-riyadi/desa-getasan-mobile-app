part of 'umkm_category_bloc.dart';

abstract class UmkmCategoryState extends Equatable {
  const UmkmCategoryState();
  
  @override
  List<Object> props() => [];
}

class UmkmCategoryInitial extends UmkmCategoryState {}

class UmkmCategoryFailed extends UmkmCategoryState {}

class UmkmCategoryLoaded extends UmkmCategoryState {

  final List<ItemBusinessCategory> umkmCategories;
  final ItemBusinessCategory selectedCategory;

  const UmkmCategoryLoaded(this.umkmCategories, this.selectedCategory);

  @override
  List<Object> props() => [umkmCategories, selectedCategory];

}

class UmkmCategoryChanged extends UmkmCategoryState {
  final List<ItemBusinessCategory> umkmCategories;
  final ItemBusinessCategory selectedCategory;

  const UmkmCategoryChanged(this.umkmCategories, this.selectedCategory);

  @override
  List<Object> props() => [umkmCategories, selectedCategory];
}
