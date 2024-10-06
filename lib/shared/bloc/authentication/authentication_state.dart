part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();
}

class AppAuthenticated extends AuthenticationState {
  const AppAuthenticated();
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();
}

class AuthenticationStart extends AuthenticationState {
  const AuthenticationStart();
}

class UserLogoutState extends AuthenticationState {
  const UserLogoutState();
}

class SetUserData extends AuthenticationState {
  const SetUserData(
    LoginData loginData,
  );
}

class AuthenticationNotAuthenticated extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  const AuthenticationFailure({required this.message});

  @override
  List<Object> get props => [message];
}
