part of 'change_password_bloc.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();
  
  @override
  List<Object> props() => [];
}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {

  final User user;

  const ChangePasswordSuccess(this.user);

  @override
  List<Object> props() => [user];  

}

class ChangePasswordFailed extends ChangePasswordState {

  final String message;

  const ChangePasswordFailed(this.message);

  @override
  List<Object> props() => [message];  

}