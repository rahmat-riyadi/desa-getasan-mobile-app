part of 'complaint_bloc.dart';

abstract class ComplaintState extends Equatable {
  const ComplaintState();
  
  @override
  List<Object> props() => [];
}

class ComplaintInitial extends ComplaintState {}

class ComplaintFailed extends ComplaintState {}

class ComplaintSended extends ComplaintState {}
