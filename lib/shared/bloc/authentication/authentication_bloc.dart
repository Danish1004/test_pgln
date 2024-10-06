import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pingolearn_assignment/common_export.dart';
import 'package:pingolearn_assignment/shared/session_manager.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SharedPrefs prefs = SharedPrefs.instance;
  final AuthenticationRepository _authenticationRepository;

  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const AuthenticationInitial()) {
    on<AppLoadedup>(_onAppLoaded);
    on<UserSignUp>(_onUserSignup);
    on<UserLogin>(_onUserLogin);
  }

  void _onAppLoaded(
      AppLoadedup event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      if (SessionManager.isLoggedIn()) {
        emit(const AppAuthenticated());
      } else {
        emit(const AuthenticationStart());
      }
    } catch (e) {
      emit(AuthenticationFailure(message: e.toString()));
    }
  }

  void _onUserLogin(UserLogin event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationLoading());
    try {
      final User? user = await _authenticationRepository.signInWithEmail(
        event.email,
        event.password,
      );

      if (user != null) {
        final loginData = LoginData(
          authToken: user.uid,
          email: event.email,
          name: user.displayName ?? '',
          phone: user.phoneNumber ?? '',
        );
        SessionManager.createLoginSession(
          loginData,
        );
        emit(const AppAuthenticated());
      } else {
        emit(AuthenticationNotAuthenticated());
      }
    } catch (e) {
      final error = _getFirebaseErrors(e.toString());
      emit(AuthenticationFailure(message: error));
    }
  }

  void _onUserSignup(
      UserSignUp event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationLoading());
    try {
      final User? user = await _authenticationRepository.registerWithEmail(
        event.name,
        event.email,
        event.password,
      );

      if (user != null) {
        final loginData = LoginData(
          authToken: user.uid,
          email: event.email,
          name: user.displayName ?? '',
          phone: user.phoneNumber ?? '',
        );
        SessionManager.createLoginSession(
          loginData,
        );
        emit(const AppAuthenticated());
      } else {
        emit(AuthenticationNotAuthenticated());
      }
    } catch (e) {
      final error = _getFirebaseErrors(e.toString());
      emit(AuthenticationFailure(message: error));
    }
  }
}

String _getFirebaseErrors(dynamic e) {
  if (e is FirebaseAuthException) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided for that user.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'operation-not-allowed':
        return 'Operation not allowed. Please enable this service in the console.';
      default:
        return 'An undefined error happened. Please try again.';
    }
  } else {
    return e.toString(); // Fallback for other types of exceptions
  }
}
