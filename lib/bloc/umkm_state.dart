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

  const UmkmLoaded({
    this.userBusinessItem = const <UserBusinessItem>[],
    this.hasReachedMax = false,
    this.currPage = 1
  });

  UmkmLoaded copyWith({
    bool? hasReachedMax,
    List<UserBusinessItem>? userBusinessItem,
    int? currPage
  }){
    return UmkmLoaded(
      userBusinessItem: userBusinessItem ?? this.userBusinessItem,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currPage: currPage ?? this.currPage
    );
  }

  @override
  List<Object> props() {
    return [userBusinessItem, hasReachedMax, currPage];
  }


}