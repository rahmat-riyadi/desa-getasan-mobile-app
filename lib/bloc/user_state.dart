part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object> props() => [];
}

class UserInitial extends UserState {}

class UserFailed extends UserState {}

class UserLoaded extends UserState {

  final User user;

  const UserLoaded(this.user);

  @override
  List<Object> props() => [user];

}
