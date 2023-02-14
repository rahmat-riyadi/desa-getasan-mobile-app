part of 'umkm_bloc.dart';

abstract class UmkmEvent extends Equatable {
  const UmkmEvent();

  @override
  List<Object> props() => [];
}

class LoadUmkmEvent extends UmkmEvent {
  final int id;

  const LoadUmkmEvent({this.id = 0});

  @override
  List<Object> props() => [id];
}
