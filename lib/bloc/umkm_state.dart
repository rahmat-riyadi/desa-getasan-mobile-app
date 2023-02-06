part of 'umkm_bloc.dart';

abstract class UmkmState extends Equatable {
  const UmkmState();
  
  @override
  List<Object> props() => [];
}

class UmkmLoading extends UmkmState {}

class UmkmFailed extends UmkmState {}

class UmkmLoaded extends UmkmState {

  final UmkmData umkmData;

  const UmkmLoaded(this.umkmData);

  @override
  List<Object> props() => [umkmData];


}