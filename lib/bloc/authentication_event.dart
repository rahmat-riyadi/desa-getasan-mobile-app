part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> props() => [];
}

class LoginEvent extends AuthenticationEvent {

  final String nik;
  final String password;

  const LoginEvent({
    required this.nik, 
    required this.password
  });

  @override
  List<Object> props() => [nik, password];

}

class LogoutEvent extends AuthenticationEvent {}