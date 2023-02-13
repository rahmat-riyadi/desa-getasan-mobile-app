part of 'umkm_bloc.dart';

abstract class UmkmEvent extends Equatable {
  const UmkmEvent();

  @override
  List<Object> props() => [];
}

class LoadUmkmEvent extends UmkmEvent {
  final int id;
  final int currentPage;
  final bool isFirst;

  const LoadUmkmEvent({this.id = 0, this.isFirst = false, this.currentPage = 1});

  @override
  List<Object> props() => [id, isFirst];
}

// class LoadUmkmByUserEvent extends UmkmEvent {

//   final int id;

// }