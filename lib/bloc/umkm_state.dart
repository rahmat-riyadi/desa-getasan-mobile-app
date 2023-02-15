part of 'umkm_bloc.dart';

abstract class UmkmState extends Equatable {
  const UmkmState();
  
  @override
  List<Object> props() => [];
}

class UmkmLoading extends UmkmState {}

class UmkmInitial extends UmkmState {}

class UmkmFailed extends UmkmState {}

class UmkmLoaded extends UmkmState {

  final bool hasReachedMax;
  final List<UserBusinessItem> userBusinessItem;
  final int currPage;
  final int categoryId;
  final int totalResults;

  const UmkmLoaded({
    this.userBusinessItem = const <UserBusinessItem>[],
    this.hasReachedMax = false,
    this.currPage = 1,
    this.categoryId = 0,
    this.totalResults = 0
  });

  UmkmLoaded copyWith({
    bool? hasReachedMax,
    List<UserBusinessItem>? userBusinessItem,
    int? currPage,
    int? categoryId,
    int? totalResults
  }){
    return UmkmLoaded(
      userBusinessItem: userBusinessItem ?? this.userBusinessItem,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currPage: currPage ?? this.currPage,
      categoryId: categoryId ?? this.categoryId,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  @override
  List<Object> props() {
    return [userBusinessItem, hasReachedMax, currPage];
  }


}