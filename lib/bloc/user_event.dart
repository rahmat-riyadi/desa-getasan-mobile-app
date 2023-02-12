part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> props() => [];
}

class LoadingUserDataEvent extends UserEvent {}

class LoadUserDataEvent extends UserEvent {}

class EmitUserDataEvent extends UserEvent {

  final User user;

  const EmitUserDataEvent(this.user);

  @override
  List<Object> props() => [user];

}
