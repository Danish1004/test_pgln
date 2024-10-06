part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppLoadedup extends AuthenticationEvent {
  const AppLoadedup();
}

class UserLogOut extends AuthenticationEvent {
  const UserLogOut();
}

class GetUserData extends AuthenticationEvent {
  const GetUserData();
}

class UserSignUp extends AuthenticationEvent {
  final String name;
  final String email;
  final String password;
  const UserSignUp(
      {required this.name, required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class UserLogin extends AuthenticationEvent {
  final String email;
  final String password;
  const UserLogin({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
