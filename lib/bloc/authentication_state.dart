part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  
  @override
  List<Object> props() => [];
}

class AuthenticationInitial extends AuthenticationState {}

class LoadingAuthenticationState extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {

  final User user;

  const AuthenticationSuccess(this.user);

  @override
  List<Object> props() => [user];

}

class AuthenticationFailed extends AuthenticationState {

  final Map<String, dynamic> error;

  const AuthenticationFailed(this.error);

  @override
  List<Object> props() => [error];

}
