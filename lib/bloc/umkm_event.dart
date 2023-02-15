part of 'umkm_bloc.dart';

abstract class UmkmEvent extends Equatable {
  const UmkmEvent();

  @override
  List<Object> props() => [];
}

class LoadUmkmEvent extends UmkmEvent {

  final bool changeCategory;
  final int id;

  const LoadUmkmEvent({this.id = 0, this.changeCategory = false});

  @override
  List<Object> props() => [id];
}
