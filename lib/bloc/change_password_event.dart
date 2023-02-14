part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> props() => [];
}

class ChangePassword extends ChangePasswordEvent {

  final String password, newPassword, confirmPassword, id;

  const ChangePassword({
    required this.password, 
    required this.newPassword, 
    required this.confirmPassword,
    required this.id
  });

  @override
  List<Object> props() => [password, newPassword, confirmPassword, id];

}